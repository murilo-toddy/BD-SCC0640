from connection import Connection
from entities.people import Person, Professor, Responsible, Student
from entities.residences import Property, Residence
from entities.transactions import RentContract
from models import Address, State
from pprint import pp

if __name__ == "__main__":
    # Person(
    #     cpf="11471634990",
    #     rg="137229919",
    #     name="tod",
    #     birthdate="27/08/2001",
    #     roles=[
    #         Student("11471634990", True, False),
    #         Professor("11471634990", "Sistemas de Recomendação"),
    #         Responsible("11471634990"),
    #     ],
    # ).insert_db()

    # Residence(
    #     45234.526,
    #     Address(State["SP"], "São Carlos", "13561130", "Teste"),
    #     Property(240000, 380, True),
    #     2,
    #     2,
    #     70,
    #     10,
    # ).insert_db()

    res = [
        RentContract.query_by_tenant_join_residence("89738378001"),
        # RentContract.query_by_responsible_join_residence("89738378001")
    ]
    for r in res:
        pp(r)

    Connection().disconnect()
