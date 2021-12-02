from pprint import pp

from connection import Connection
from entities.people import Person, Professor, Responsible
from entities.residences import Property, Residence
from entities.transactions import RentContract, SaleContract
from enums import State
from models import Address

try:
    Person(
        cpf="11471634990",
        rg="137229919",
        name="Murilo Todão",
        birthdate="27/08/2001",
        roles=[
            Professor("11471634990", "Bases de Dados"),
            Responsible("11471634990"),
        ],
    ).insert_db()

    Residence(
        rent=45234.526,
        address=Address(State["SP"], "São Carlos", "13561130", "Teste"),
        specialization=Property(240000, 380, True),
        n_rooms=2,
        n_bathrooms=2,
        inner_area=70,
        outer_area=10,
    ).insert_db()
except Exception:
    pass

res = [
    RentContract.query_by_tenant_join_residence("89738378001"),
    RentContract.query_by_responsible_join_residence("93078701018"),
    SaleContract.query_by_tenant_join_residence("83353310061"),
    SaleContract.query_by_responsible_join_residence("45446434064"),
]
for r in res:
    pp(r)

Connection().disconnect()
