from connection import Connection
from entities.people import Person


class Database:
    def __init__(self, connection=Connection()):
        self.connection = connection

    def __execute_and_commit(self, command):
        self.connection.cursor.execute(command)
        self.connection.connection.commit()

    def insert_person(self, person: Person):
        cpf = person.get_cpf()
        rg = person.get_rg()
        name = person.get_name()
        birthdate = person.get_birthdate_str()

        sql_cmd = f"""INSERT INTO pessoa(CPF, RG, nome, nascimento)
                VALUES({cpf}, {rg}, {name}, TO_DATE({birthdate}, 'DD/MM/YYYY'));"""

        self.__execute_and_commit(sql_cmd)
