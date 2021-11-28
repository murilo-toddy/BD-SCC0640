from connection import Connection
from entities.people import Person


class Database:
    """
    A manager interface for the system's database, with methods to CRUD data.
    """

    def __init__(self, connection=Connection()):
        self.__connection: Connection = connection

    def __execute_and_commit(self, command):
        """
        Executes an SQL command and commits it.
        """
        self.__connection.cursor.execute(command)
        self.__connection.connection.commit()

    def insert_person(self, person: Person):
        """
        Inserts a person's data in the DB, considering all necessary tables:
        'pessoa', 'atuacao', 'aluno', 'professor' and 'responsavel'.
        """

        cpf = person.get_cpf()
        rg = person.get_rg()
        name = person.get_name()
        birthdate = person.get_birthdate_str()

        sql_cmd = f"INSERT INTO pessoa(CPF, RG, nome, nascimento) \
            VALUES({cpf}, {rg}, {name}, TO_DATE({birthdate}, 'DD/MM/YYYY'));"

        self.__execute_and_commit(sql_cmd)
