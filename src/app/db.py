from connection import Connection
from entities.people import Person


class Database:
    """
    A manager interface for the system's database, with methods to CRUD data.
    """

    def __init__(self, connection=Connection()):
        self.__connection: Connection = connection

    def disconnect(self):
        self.__connection.disconnect()

    def insert_person(self, person: Person):
        """
        Inserts a person's data in the DB, considering all necessary tables:
        'pessoa', 'atuacao', 'aluno', 'professor' and 'responsavel'.
        """

        cpf = person.get_cpf()
        rg = person.get_rg()
        name = person.get_name()
        birthdate = person.get_birthdate_str()
        roles = person.get_roles()

        # psycopg2'll sanitize the inputs (prevents SQL Injection)
        query = "INSERT INTO pessoa(CPF, RG, nome, nascimento) VALUES(%s, %s,\
            %s, TO_DATE(%s, 'DD/MM/YYYY'));"
        self.__connection.exec_commit(query, cpf, rg, name, birthdate)

        # inserts each role
        role_query = "INSERT INTO atuacao(pessoa, atuacao) VALUES(%s, %s);"
        for role in roles:
            self.__connection.exec_commit(role_query, cpf, role)
