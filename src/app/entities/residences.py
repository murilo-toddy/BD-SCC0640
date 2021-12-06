from abc import ABC, abstractmethod

from connection import Connection
from entities.people import Person, Responsible
from enums import PersonPermissions
from models import Address
from utils import assert_instance, assert_regex, regexes, remove_symbols


class Responsability:
    @staticmethod
    def query_by_responsible_join_residence(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT endereço, cidade, estado, condominio, coletividade,
            permissao_venda, aluguel, valor_venda, n_moradores
            FROM responsabilidade as P
            INNER JOIN residencia as R on P.residencia = R.id
            LEFT JOIN imovel as I ON R.id = I.id AND R.coletividade = false
            LEFT JOIN moradia as M ON R.id = M.id AND R.coletividade = true
            WHERE P.responsavel = %s AND
            (P.residencia, P.responsavel) NOT IN
            (SELECT residencia, responsavel FROM venda);
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())

    def __init__(self, responsible: str, residence: int = None, can_sell: bool = None):
        assert_regex(responsible, regexes.cpf)

        self.responsible = remove_symbols(responsible)
        self.residence = residence
        self.can_sell = can_sell
        self.__connection = Connection()

        # checks if the responsible exists
        responsible_exists = Person.query_by_cpf(self.responsible)
        if not responsible_exists:
            responsible = None

    def set_residence(self, residence_id: int, can_sell: bool):
        if not self.responsible:
            return False, "O responsável passado para essa residência não existe."
        elif self.residence:
            return
        self.residence = residence_id
        self.can_sell = can_sell

    def insert_db(self):
        if not self.responsible:
            return False, "O responsável passado para essa residência não existe."
        elif not self.residence:
            return False, "Nenhuma residência foi fornecida."

        query = "INSERT INTO responsabilidade(residencia, responsavel, \
                permissao_venda) VALUES(%s, %s, %s);"
        try:
            self.__connection.exec_commit(
                query, self.residence, self.responsible, self.can_sell
            )
        except Exception as error:
            return False, error

        permissions = Person.query_permissions_by_cpf(self.responsible)
        if PersonPermissions.Responsible.value not in permissions:
            query = "INSERT INTO atuacao(pessoa, atuacao) VALUES(%s, %s);"
            try:
                self.__connection.exec_commit(
                    query, self.responsible, PersonPermissions.Responsible.value
                )
            except Exception as error:
                return False, error

            return Responsible(self.responsible).insert_db()
        else:
            return True, None


class ResidenceSpecialization(ABC):
    def set_id(self, id: int) -> None:
        self.id = id

    @abstractmethod
    def is_coletive(self) -> bool:
        pass

    @abstractmethod
    def insert_db(self) -> tuple[bool, Exception]:
        pass


class Home(ResidenceSpecialization):
    def __init__(
        self, n_residents: int, n_roomates: int, n_pets: int, total_capacity: int
    ):
        self.n_residents = n_residents
        self.n_roomates = n_roomates
        self.n_pets = n_pets
        self.total_capacity = total_capacity
        self.id = None
        self.inserted = False
        self.__connection = Connection()

    def is_coletive(self) -> bool:
        return True

    def insert_db(self) -> tuple[bool, Exception]:
        """Insert the home's data in the DB."""
        if self.inserted:
            return False, "Essa moradia já foi inserida."

        query = "INSERT INTO moradia(id, n_moradores, n_colegas_quarto, \
                n_animais, n_total_vagas) VALUES(%s, %s, %s, %s, %s);"

        try:
            self.__connection.exec_commit(
                query,
                self.id,
                self.n_residents,
                self.n_roomates,
                self.n_pets,
                self.total_capacity,
            )
        except Exception as error:
            return False, error
        else:
            return True, None

        self.inserted = True


class Property(ResidenceSpecialization):
    def __init__(self, value: float, condominium: float, allow_pets: bool):
        self.value = value
        self.condominium = condominium
        self.allow_pets = allow_pets
        self.id = None
        self.inserted = False
        self.__connection = Connection()

    def is_coletive(self) -> bool:
        return False

    def insert_db(self) -> tuple[bool, Exception]:
        """Insert the property's data in the DB."""
        if self.id is None or self.inserted:
            return False, "Esse imóvel já foi inserido."

        query = "INSERT INTO imovel(id, valor_venda, condominio, \
                aceita_animais) VALUES(%s, %s, %s, %s);"
        try:
            self.__connection.exec_commit(
                query, self.id, self.value, self.condominium, self.allow_pets
            )
        except Exception as error:
            return False, error
        else:
            self.inserted = True
            return True, None


class Residence:
    def __init__(
        self,
        rent: float,
        address: Address,
        specialization: ResidenceSpecialization,
        n_rooms: int,
        n_bathrooms: int,
        inner_area: int,
        outer_area: int,
        responsible: str,
        extra_info: str = None,
    ):
        assert_regex(responsible, regexes.cpf)
        assert_instance(address, Address)
        assert_instance(specialization, ResidenceSpecialization)

        self.address = address.address
        self.cep = address.cep
        self.city = address.city
        self.rent = rent
        self.state = address.state
        self.coletivity = specialization.is_coletive()
        self.specialization = specialization
        self.n_rooms = n_rooms
        self.n_bathrooms = n_bathrooms
        self.inner_area = inner_area
        self.outer_area = outer_area
        self.extra_info = extra_info
        self.inserted = False
        self.responsible = responsible
        self.__connection = Connection()

    def insert_db(self) -> tuple[bool, Exception]:
        """Insert the residence's data in the DB, including it's specialization."""
        if self.inserted:
            return False, "Essa residência já foi inserida."

        # makes sure the passed responsible exists
        responsability = Responsability(self.responsible)
        if not responsability.responsible:
            return False, "O responsável passado para essa residência não existe."

        query = "INSERT INTO residencia(aluguel, coletividade, estado, cidade, \
                cep, endereço, n_quartos, n_banheiros, area_interna, \
                area_externa, infos_adicionais) VALUES(%s, %s, %s, %s, %s, %s, \
                %s, %s, %s, %s, %s) RETURNING id;"
        # insert the residence
        try:
            id = self.__connection.exec_commit(
                query,
                self.rent,
                self.coletivity,
                self.state.name,
                self.city,
                self.cep,
                self.address,
                self.n_rooms,
                self.n_bathrooms,
                self.inner_area,
                self.outer_area,
                self.extra_info,
                cb=lambda cur: cur.fetchone()["id"],
            )
        except Exception as error:
            return False, error
        else:
            self.inserted = True

            # inserts the responsability relationship
            responsability.set_residence(id, True)
            ok, error = responsability.insert_db()
            if not ok:
                return False, error

            # insert it's specialization
            self.specialization.set_id(id)
            return self.specialization.insert_db()
