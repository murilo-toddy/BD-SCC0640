import datetime
import re

from enums import State


class regexes:
    """
    Various utilities regexes to validate data.
    """

    cpf = re.compile(r"^(\d{3})\.?(\d{3})\.?(\d{3})\-?(\d{2})$")
    rg = re.compile(r"^(\d{1,2})\.?(\d{3})\.?(\d{3})-?(\d{1}|X|x)$")
    cep = re.compile(r"^(\d{5})-?(\d{3})$")


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


def prompt(text: str, validate: callable = None) -> str:
    """
    Prompts user for input and only returns when the input is valid.

    Parameters:
    -----------
    text : str
        Input prompt.
    validate : function = None
        Validator for the input - if none is provided, all input is considered
        valid. It should receive a string to validate as parameter and return a
        bool.

    Returns:
    --------
    str : the user's validated input.
    """

    r = input(text)

    if validate:
        is_valid = validate(r)
        while not is_valid:
            r = input("\nInput inválido, tente novamente. " + text)
            is_valid = validate(r)

    return r


def prompt_continue() -> None:
    """
    Prompts user to press Enter to continue.
    """

    input("Aperte ENTER para continuar. ")


def prompt_menu(options: list[str], leading_text: str = "") -> int:
    """
    Prompts user to choose an option from the menu and returns the option's
    index.

    Parameters:
    -----------
    options : list[str]
        Menu optons in order. Indexing them (e.g. "1. Options ...") is not
        necessary and will be done automatically.

    Returns:
    --------
    int : the chosen option's index (`0, ..., len(options)`).
    """

    if not (options and isinstance(options, list)):
        return None

    n_options = len(options)
    options = "\n".join([f"{i+1}. {o}" for i, o in enumerate(options)])

    text = (
        leading_text
        + (" " if leading_text and not leading_text.endswith("\n") else "")
        + "Selecione uma das opções do menu a seguir para continuar.\n\n"
        + options
        + "\n\nPara selecionar, insira apenas o número da opção. Input: "
    )

    def validate(option: str):
        """
        Validates the user input for the menu.
        """
        if option.endswith("."):
            option = option[:-1]
        return option.isnumeric() and int(option) <= n_options

    r = prompt(text, validate)

    return int(r.replace(".", "")) - 1


def format(target: any, type: str = ""):
    """
    Formats the input according to the specified type (only required for CEP and
    RG).
    """

    if isinstance(target, datetime.date):
        return f"{target.day}/{target.month}/{target.year}"

    if target in State:
        return State[target].value

    if isinstance(target, State):
        return target.value

    cpf = regexes.cpf.match(target)
    if cpf:
        _1, _2, _3, _4 = cpf.groups()
        return f"{_1}.{_2}.{_3}-{_4}"

    cep = regexes.cep.match(target)
    if cep and type.upper() == "CEP":
        _1, _2 = cep.groups()
        return f"{_1}-{_2}"

    rg = regexes.rg.match(target)
    if rg and type.upper() == "RG":
        _1, _2, _3, _4 = rg.groups()
        return f"{_1}.{_2}.{_3}-{_4}"

    return target
