from entities.people import Person
from utils import assert_regex, regexes, remove_symbols


class CurrentUser:
    """Singleton for getting the current user's info."""

    # Guarantees the CurrentUser class is a Singleton
    def __new__(cls, cpf=None):
        if not hasattr(cls, "instance"):
            cls.instance = super(CurrentUser, cls).__new__(cls)
        return cls.instance

    def __init__(self, cpf: str = None):
        if cpf is not None:
            assert_regex(cpf, regexes.cpf)
            self.__cpf = remove_symbols(cpf)

            user_exists = Person.query_by_cpf(self.__cpf)
            if not user_exists:
                raise Exception('Não existe um usuário com esse CPF.')

    def get_cpf(self):
        return self.__cpf

    def fetch_data(self):
        return Person.query_by_cpf_join_specializations(self.__cpf)

    def fetch_name(self):
        return self.fetch_data()["nome"]

    def fetch_permissions(self):
        return Person.query_permissions_by_cpf(self.__cpf)
