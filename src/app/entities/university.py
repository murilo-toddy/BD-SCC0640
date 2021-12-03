from connection import Connection
from utils import assert_regex, regexes


class Talks:
    @staticmethod
    def fetch_by_professor_join_campus(professor: str):
        assert_regex(professor, regexes.cpf, "cpf")

        query = """
            SELECT ministrante, nome, cidade, estado, nome_campus AS campus,
            nome_universidade AS universidade, data_horario, tema
            FROM palestra as P, campus as C
            WHERE P.ministrante = %s AND P.campus = C.id
            ORDER BY data_horario DESC;
        """
        return Connection().exec_commit(query, professor, cb=lambda cur: cur.fetchall())
