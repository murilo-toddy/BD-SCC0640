from abc import ABC, abstractmethod

from connection import Connection
from models import Address
from utils import assert_instance


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
        """
        Inserts the home's data in the DB.
        """

        if self.inserted:
            return

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
        """
        Inserts the property's data in the DB.
        """

        if self.id is None or self.inserted:
            return

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
        extra_info: str = None,
    ):
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
        self.__connection = Connection()

    def insert_db(self) -> tuple[bool, Exception]:
        """
        Inserts the residence's data in the DB, including it's specialization.
        """

        if self.inserted:
            return

        # psycopg2'll sanitize the inputs (prevents SQL Injection)
        query = "INSERT INTO residencia(aluguel, coletividade, estado, cidade, \
                cep, endereço, n_quartos, n_banheiros, area_interna, \
                area_externa, infos_adicionais) VALUES(%s, %s, %s, %s, %s, %s, \
                %s, %s, %s, %s, %s) RETURNING id;"
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

            self.specialization.set_id(id)
            return self.specialization.insert_db()
