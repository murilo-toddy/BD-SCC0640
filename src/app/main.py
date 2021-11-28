from connection import Connection
from entities.people import Person
from enums import PersonRole

from db import Database

if __name__ == "__main__":
    db = Database()

    person = Person(
        cpf="11471634990",
        rg="137229919",
        name="tod",
        birthdate="27/08/2001",
        roles=PersonRole.Professor,
    )

    db.insert_person(person)

    Connection.disconnect()
