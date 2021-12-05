from abc import ABC, abstractmethod
from datetime import datetime
from itertools import chain
from typing import Union

from connection import Connection
from enums import PersonPermissions
from utils import assert_instance, assert_regex, assert_value, regexes, remove_symbols


class PersonRole(ABC):
    __permission: PersonPermissions
    cpf: str

    def get_permissions(self) -> PersonPermissions:
        return self.__permission.value

    @abstractmethod
    def insert_db(self) -> tuple[bool, Exception]:
        pass


class Student(PersonRole):
    __permission: PersonPermissions = PersonPermissions.Student

    @staticmethod
    def increment_indicatins_by_cpf(cpf: str) -> tuple[bool, Exception]:
        assert_regex(cpf, regexes.cpf, "cpf")

        cpf = remove_symbols(cpf)

        permissions = Person.query_permissions_by_cpf(cpf)

        if PersonPermissions.Student.value not in permissions:
            return True, None

        connection = Connection()
        query = "UPDATE aluno SET n_indicacoes = n_indicacoes + 1 \
                WHERE CPF = %s"

        try:
            connection.exec_commit(query, cpf)
        except Exception as error:
            return False, error
        else:
            return True, None

    def __init__(
        self,
        cpf: str,
        searching_home: bool,
        searching_property: bool,
        indicator: str = None,
    ):
        assert_regex(cpf, regexes.cpf, "cpf")

        self.cpf = remove_symbols(cpf)
        self.searching_home = searching_home
        self.searching_property = searching_property
        self.no_indications = 0
        self.__indicator = indicator
        self.__connection = Connection()

    @staticmethod
    def __str__() -> str:
        return Student.__permission.value

    def insert_db(self) -> tuple[bool, Exception]:
        """Insert the student's data in the DB."""
        query = "INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, \
            procurando_imovel) VALUES(%s, %s, %s, %s);"
        try:
            self.__connection.exec_commit(
                query,
                self.cpf,
                self.no_indications,
                self.searching_home,
                self.searching_property,
            )
        except Exception as error:
            return False, error
        else:
            return Student.increment_indicatins_by_cpf(self.__indicator)


class Professor(PersonRole):
    permission: PersonPermissions = PersonPermissions.Professor

    def __init__(self, cpf: str, occupation_area: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        self.cpf = remove_symbols(cpf)
        self.occupation_area = occupation_area
        self.__connection = Connection()

    @staticmethod
    def __str__() -> str:
        return Professor.permission

    def insert_db(self) -> tuple[bool, Exception]:
        """Insert the professor's data in the DB."""
        query = "INSERT INTO professor(CPF, area_atuacao) VALUES(%s, %s);"
        try:
            self.__connection.exec_commit(query, self.cpf, self.occupation_area)
        except Exception as error:
            return False, error
        else:
            return True, None


class Responsible(PersonRole):
    permission: PersonPermissions = PersonPermissions.Responsible

    def __init__(self, cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        self.cpf = remove_symbols(cpf)
        self.__connection = Connection()

    @staticmethod
    def __str__() -> str:
        return Responsible.permission

    def insert_db(self) -> tuple[bool, Exception]:
        """Insert the responsible's data in the DB."""
        query = "INSERT INTO responsavel(CPF) VALUES(%s);"
        try:
            self.__connection.exec_commit(query, self.cpf)
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

        # gets the user's roles
        query = "SELECT atuacao from atuacao WHERE pessoa = %s"
        rows = connection.exec_commit(query, cpf, cb=lambda cur: cur.fetchall())
        roles = [row["atuacao"] for row in rows]

        # list of desired columns for each role
        columns = {
            PersonPermissions.Student.value: ["n_indicacoes"],
            PersonPermissions.Professor.value: ["area_atuacao"],
            PersonPermissions.Responsible.value: [],
        }

        # roles that we want at least one column from
        derised_roles = [role for role in roles if columns[role]]

        # create comma-separated list for all selected
        # columns for the person's roles.
        # chain(*[...]) is used to flatten the list, so
        # we'll have [(<role-name>, <desired-column>)]
        columns_expr = ", ".join(
            f"{table}.{col}"
            for table, col in chain(*[[(k, c) for c in v] for k, v in columns.items()])
            if table in roles
        )
        columns_expr = columns_expr and f", {columns_expr}"

        # expressions for joining with the necessary role
        # tables (if we want at least one column from them)
        join_expr = "\n".join(
            f"INNER JOIN {role} ON {role}.CPF = %s" for role in derised_roles
        )

        # build the query
        query = f"""
            SELECT P.CPF, RG, nome, nascimento {columns_expr}
            FROM pessoa as P
            {join_expr}
            WHERE P.CPF = %s
        """
        args = [cpf] * (len(derised_roles) + 1)

        person = connection.exec_commit(query, *args, cb=lambda cur: cur.fetchone())
        person["atuacao"] = roles

        return person

    @staticmethod
    def query_by_cpf(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        cpf = remove_symbols(cpf)
        connection = Connection()

        query = "SELECT CPF, RG, nome, nascimento FROM pessoa WHERE CPF = %s"
        person = connection.exec_commit(query, cpf, cb=lambda cur: cur.fetchone())

        return person

    @staticmethod
    def query_permissions_by_cpf(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        cpf = remove_symbols(cpf)
        connection = Connection()

        query = "SELECT atuacao from atuacao WHERE pessoa = %s"
        rows = connection.exec_commit(query, cpf, cb=lambda cur: cur.fetchall())

        return [row["atuacao"] for row in rows]

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

        self.cpf = remove_symbols(cpf)

        for role in roles:
            assert_instance(role, PersonRole)
            assert_value(role.cpf, self.cpf)  # the key must match

        self.__connection = Connection()
        self.rg = remove_symbols(rg.upper())
        self.name = name.title().strip()
        self.birthdate = birthdate
        self.roles = roles

    def get_permissions(self) -> list[PersonPermissions]:
        return [role.get_permissions() for role in self.roles]

    def get_birthdate_str(self) -> str:
        """Convert the Persn's birthdate as a string in format DD/MM/YYYY."""
        return self.birthdate.strftime("%d/%m/%Y")

    def insert_db(self) -> tuple[bool, Exception]:
        """
        Insert the person's data in the DB, including all of it's roles in the
        necessary tables: 'pessoa', 'atuacao', 'aluno', 'professor' and
        'responsavel'.
        """
        name = self.name
        birthdate = self.get_birthdate_str()

        try:
            query = "INSERT INTO pessoa(CPF, RG, nome, nascimento) VALUES(%s, %s,\
                %s, TO_DATE(%s, 'DD/MM/YYYY'));"
            self.__connection.exec_commit(query, self.cpf, self.rg, name, birthdate)
        except Exception as error:
            return False, error
        else:
            # inserts each role
            query = "INSERT INTO atuacao(pessoa, atuacao) VALUES(%s, %s);"
            for role in self.roles:
                self.__connection.exec_commit(query, self.cpf, str(role))
                ok, error = role.insert_db()

                if not ok:
                    return False, error

            return True, None
