import re


class regexes:
    """
    Various utilities regexes to validate data.
    """

    cpf = re.compile(r"^\d{3}\.?\d{3}\.?\d{3}\-?\d{2}$")
    rg = re.compile(r"^(\d{1,2})\.?(\d{3})\.?(\d{3})-?(\d{1}|X|x)$")
    cep = re.compile(r"^\d{5}-?\d{3}$")


def assert_regex(string: str, regex: re.Pattern, name: str = "") -> None:
    """
    Raises an error if a given string does not match a given pattern.

    Parameters
    ----------
    string : str
        The string to be tested.
    regex : re.Pattern
        The pattern to test `string` against.
    name : str (default '')
        The string's name to be specified in the error message.
    """
    if not regex.match(string):
        raise ValueError(f"'{name or string}' is invalid.")


def assert_instance(variable: any, _class: object, name: str = "") -> None:
    """
    Raises an error if a given variable isn't an instance of a given class.

    Parameters
    ----------
    variable : any
        The variable to be tested.
    _class : object
        The class that `variable` should be an instance of.
    name : str (default '')
        The variable's name to be specified in the error message.
    """
    if not isinstance(variable, _class):
        raise ValueError(f"'{name or variable}' has an invalid type.")


def assert_value(a: any, b: any, name: str = "") -> None:
    """
    Raises an error if a given variable isn't equal to another.

    Parameters
    ----------
    a, b : any
        The variables to be compared.
    name : str (default '')
        `a`'s name to be specified in the error message.
    """
    if a != b:
        raise ValueError(f"'{name}' is invalid ({a} doesn't match {b}).")


def remove_symbols(string: str) -> str:
    """
    Removes everything that's not a letter nor a number from the given string.
    """
    return re.sub(r"[^a-zA-Z0-9]", "", string)
