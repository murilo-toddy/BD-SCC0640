from entities.people import Person


class CurrentUser:
    """Singleton for getting the current user's info."""

    __cpf = "61520188030"

    # Guarantees the CurrentUser class is a Singleton
    def __new__(cls):
        if not hasattr(cls, "instance"):
            cls.instance = super(CurrentUser, cls).__new__(cls)
        return cls.instance

    def get_cpf(self):
        return self.__cpf

    def fetch_data(self):
        return Person.query_by_cpf_join_specializations(self.__cpf)

    def fetch_name(self):
        return self.fetch_data()["nome"]

    def fetch_permissions(self):
        return Person.query_permissions_by_cpf(self.__cpf)
