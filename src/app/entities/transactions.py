from connection import Connection
from utils import assert_regex, regexes


class RentContract:
    @staticmethod
    def query_by_tenant(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = "SELECT inicio, residencia, fim, aluguel FROM contrato_aluguel \
                WHERE locatario IS %s"
        return Connection().exec_commit(query, cpf, lambda cur: cur.fetchall())
