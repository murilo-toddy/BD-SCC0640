from enums import State
from utils import assert_instance, assert_regex, regexes


class Address:
    def __init__(self, state: State, city: str, cep: str, address: str):
        assert_instance(state, State)
        assert_regex(cep, regexes.cep)

        self.state = state
        self.city = city
        self.cep = cep
        self.address = address
