from abc import ABC, abstractmethod
from datetime import datetime
from itertools import chain
from typing import Union

from connection import Connection
from utils import assert_instance, assert_regex, assert_value, regexes, remove_symbols


class PersonRole(ABC):
    @abstractmethod
    def get_cpf(self) -> str:
        pass

    @abstractmethod
    def insert_db(self) -> tuple[bool, Exception]:
        pass


class Student(PersonRole):
    __value = "aluno"

    def __init__(self, cpf: str, searching_home: bool, searching_property: bool):
        assert_regex(cpf, regexes.cpf, "cpf")

        self.__cpf = remove_symbols(cpf)
        self.__searching_home = searching_home
        self.__searching_property = searching_property
        self.__no_indications = 0
        self.__connection = Connection()

    @staticmethod
    def __str__() -> str:
        return Student.__value

    def get_cpf(self) -> str:
        return self.__cpf

    def get_no_indications(self) -> int:
        return self.__no_indications

    def is_searching_home(self) -> bool:
        return self.__searching_home

    def is_searching_property(self) -> bool:
        return self.__searching_property

    def insert_db(self) -> tuple[bool, Exception]:
        """
        Inserts the student's data in the DB.
        """

        searching_home = self.__searching_home
        searching_property = self.__searching_property
        no_indications = self.__no_indications

        # psycopg2'll sanitize the inputs (prevents SQL Injection)
        query = "INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, \
            procurando_imovel) VALUES(%s, %s, %s, %s);"
        try:
            self.__connection.exec_commit(
                query, self.__cpf, no_indications, searching_home, searching_property
            )
        except Exception as error:
            return False, error
        else:
            return True, None


class Professor(PersonRole):
    __value = "professor"

    def __init__(self, cpf: str, occupation_area: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        self.__cpf = remove_symbols(cpf)
        self.__occupation_area = occupation_area
        self.__connection = Connection()

    @staticmethod
    def __str__() -> str:
        return Professor.__value

    def get_cpf(self) -> str:
        return self.__cpf

    def get_occupation_area(self) -> int:
        return self.__no_indications

    def insert_db(self) -> tuple[bool, Exception]:
        """
        Inserts the professor's data in the DB.
        """

        # psycopg2'll sanitize the inputs (prevents SQL Injection)
        query = "INSERT INTO professor(CPF, area_atuacao) VALUES(%s, %s);"
        try:
            self.__connection.exec_commit(query, self.__cpf, self.__occupation_area)
        except Exception as error:
            return False, error
        else:
            return True, None

    def fetch_own_rents(self):
        pass


class Responsible(PersonRole):
    __value = "responsavel"

    def __init__(self, cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        self.__cpf = remove_symbols(cpf)
        self.__connection = Connection()

    @staticmethod
    def __str__() -> str:
        return Responsible.__value

    def get_cpf(self) -> str:
        return self.__cpf

    def insert_db(self) -> tuple[bool, Exception]:
        """
        Inserts the responsible's data in the DB.
        """

        # psycopg2'll sanitize the inputs (prevents SQL Injection)
        query = "INSERT INTO responsavel(CPF) VALUES(%s);"
        try:
            self.__connection.exec_commit(query, self.__cpf)
        except Exception as error:
            return False, error
        else:
            return True, None


class Person:
    @staticmethod
    def query_by_cpf_join_specializations(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        cpf = remove_symbols(cpf)
        connection = Connection()

        query = "SELECT atuacao from atuacao WHERE pessoa = %s"
        rows = connection.exec_commit(query, cpf, cb=lambda cur: cur.fetchall())
        roles = [row["atuacao"] for row in rows]

        # list of columns per row
        columns = {
            Student.__str__(): ["n_indicacoes"],
            Professor.__str__(): ["area_atuacao"],
            Responsible.__str__(): [],
        }

        # create comma-separated list for all selected
        # columns for the person's roles
        columns = ", ".join(
            f"{table}.{col}"
            for table, col in chain(*[[(k, c) for c in v] for k, v in columns.items()])
            if table in roles
        )
        if columns:
            columns = ", " + columns

        join_expressions = "\n".join(
            f"INNER JOIN {role} ON {role}.CPF = %s" for role in roles
        )

        query = f"""
            SELECT P.CPF, RG, nome, nascimento {columns} FROM pessoa as P
            {join_expressions}
            WHERE P.CPF = %s
        """
        args = [cpf] * (len(roles) + 1)

        return connection.exec_commit(query, *args, cb=lambda cur: cur.fetchone()), roles

    def __init__(
        self,
        cpf: str,
        rg: str,
        name: str,
        birthdate: Union[datetime, str],
        roles: Union[list[PersonRole], PersonRole],
    ):
        if isinstance(birthdate, str):
            birthdate = datetime.strptime(birthdate, "%d/%m/%Y")

        assert_regex(name, regexes.name)
        assert_regex(cpf, regexes.cpf)
        assert_regex(rg, regexes.rg)
        assert_instance(birthdate, datetime)

        if isinstance(roles, PersonRole):
            roles = [roles]

        assert_instance(roles, list)

        for role in roles:
            assert_instance(role, PersonRole)
            assert_value(role.get_cpf(), remove_symbols(cpf))

        self.__connection = Connection()
        self.__cpf = remove_symbols(cpf)
        self.__rg = remove_symbols(rg.upper())
        self.__name = name.title().strip()
        self.__birthdate = birthdate
        self.__roles = roles

    def get_cpf(self) -> str:
        return self.__cpf

    def get_rg(self) -> str:
        return self.__rg

    def get_name(self) -> str:
        return self.__name

    def get_birthdate(self) -> datetime:
        return self.__birthdate

    def get_birthdate_str(self) -> str:
        return self.__birthdate.strftime("%d/%m/%Y")

    def get_roles(self) -> list[PersonRole]:
        return self.__roles

    def insert_db(self) -> tuple[bool, Exception]:
        """
        Inserts the person's data in the DB, including all of it's roles in the
        necessary tables: 'pessoa', 'atuacao', 'aluno', 'professor' and
        'responsavel'.
        """

        cpf = self.__cpf
        rg = self.__rg
        name = self.__name
        birthdate = self.get_birthdate_str()

        try:
            # psycopg2'll sanitize the inputs (prevents SQL Injection)
            query = "INSERT INTO pessoa(CPF, RG, nome, nascimento) VALUES(%s, %s,\
                %s, TO_DATE(%s, 'DD/MM/YYYY'));"
            self.__connection.exec_commit(query, cpf, rg, name, birthdate)
        except Exception as error:
            return False, error
        else:
            # inserts each role
            query = "INSERT INTO atuacao(pessoa, atuacao) VALUES(%s, %s);"
            for role in self.__roles:
                self.__connection.exec_commit(query, cpf, str(role))
                ok, error = role.insert_db()

                if not ok:
                    return False, error

            return True, None
