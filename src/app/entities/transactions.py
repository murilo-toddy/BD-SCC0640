from abc import ABC, abstractmethod
from connection import Connection
from utils import assert_regex, regexes


class Contract(ABC):
    @abstractmethod
    def query_by_tenant_join_residence(cpf: str):
        pass

    @abstractmethod
    def query_by_responsible_join_residence(cpf: str):
        pass


class RentContract(Contract):
    @staticmethod
    def query_by_tenant_join_residence(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT endereço, cidade, estado, inicio, fim, C.aluguel, condominio,
            coletividade, responsavel AS responsavel_cpf, P.nome AS responsavel_nome
            FROM contrato_aluguel as C
            INNER JOIN residencia as R on C.residencia = R.id
            INNER JOIN pessoa as P on C.responsavel = P.CPF
            LEFT JOIN imovel as I ON R.id = I.id
            WHERE C.locatario = %s
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())

    @staticmethod
    def query_by_responsible_join_residence(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT endereço, cidade, estado, inicio, fim, C.aluguel, condominio,
            coletividade, locatario AS locatario_cpf, P.nome AS locatario_nome
            FROM contrato_aluguel as C
            INNER JOIN residencia as R on C.residencia = R.id
            INNER JOIN pessoa as P on C.locatario = P.CPF
            LEFT JOIN imovel as I ON R.id = I.id
            WHERE C.responsavel = %s
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())


class SaleContract(Contract):
    @staticmethod
    def query_by_buyer_join_residence(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT endereço, cidade, estado, data, valor, condominio
            FROM venda as V, residencia as R, imovel as I
            WHERE V.comprador = %s AND R.coletividade = false AND
                  V.residencia = R.id AND R.id = I.id
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())

    @staticmethod
    def query_by_responsible_join_residence(cpf: str):
        assert_regex(cpf, regexes.cpf, "cpf")

        query = """
            SELECT endereço, cidade, estado, data, valor, condominio
            FROM venda as V, residencia as R, imovel as I
            WHERE V.responsavel = %s AND R.coletividade = false AND
                  V.residencia = R.id AND R.id = I.id
        """
        return Connection().exec_commit(query, cpf, cb=lambda cur: cur.fetchall())
