from connection import Connection
from utils import assert_regex, regexes


class RentContract:
    @staticmethod
    def query_by_tenant(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT inicio, residencia, fim, aluguel FROM contrato_aluguel
            WHERE locatario = %s
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())

    @staticmethod
    def query_by_tenant_join_residence(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT endereço, cidade, estado, inicio, fim, C.aluguel, condominio,
            coletividade
            FROM contrato_aluguel as C
            INNER JOIN residencia as R on C.residencia = R.id
            LEFT JOIN imovel as I ON R.id = I.id
            WHERE C.locatario = %s
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())

    @staticmethod
    def query_by_responsible_join_residence(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT endereço, cidade, estado, inicio, fim, C.aluguel, condominio,
            coletividade
            FROM contrato_aluguel as C
            INNER JOIN residencia as R on C.residencia = R.id
            LEFT JOIN imovel as I ON R.id = I.id
            WHERE C.responsavel = %s
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())
