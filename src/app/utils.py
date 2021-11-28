import re


class regexes:
    cpf = re.compile(r"^[0-9]{3}\.?[0-9]{3}\.?[0-9]{3}\-?[0-9]{2}$")
    rg = re.compile(r"^(\d{1,2})\.?(\d{3})\.?(\d{3})-?(\d{1}|X|x)$")
    cep = re.compile(r"^\d{5}-?\d{3}$")


def remove_symbols(string: str) -> str:
    """
    Removes everything that's not a letter nor a number from the given string.
    """

    return re.sub(r"[^a-zA-Z0-9]", "", string)
