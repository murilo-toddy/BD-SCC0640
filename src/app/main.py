from connection import Connection
from entities.people import Person, Professor, Responsible, Student

if __name__ == "__main__":
    Person(
        cpf="11471634990",
        rg="137229919",
        name="tod",
        birthdate="27/08/2001",
        roles=[
            Student("11471634990", True, False),
            Professor("11471634990", "Sistemas de Recomendação"),
            Responsible("11471634990"),
        ],
    ).insert_db()

    Connection().disconnect()
