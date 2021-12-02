from state import get_current_user_data
from entities.people import Person, Student, Professor
from utils import (
    parse_bool,
    prompt,
    prompt_continue,
    regexes,
    validate_bool,
    validate_date,
    format,
)


def fetch_own_data():
    user = get_current_user_data()
    print(f"\n\nNome completo: {user['nome']}")
    print(f"CPF: {format(user['cpf'])}")
    print(f"RG: {format(user['rg'], 'rg')}")
    print(f"Data de nascimento: {format(user['nascimento'])}")
    print(f"Categorias: {format(user['atuacao'])}")

    if Student.__str__() in user['atuacao']:
        print(f"Número de indicações acumuladas: {user['n_indicacoes']}")
    if Professor.__str__() in user['atuacao']:
        print(f"Área de atuação: {user['area_atuacao']}")

    prompt_continue()


def register_student():
    person = {}
    student = {}

    print("\n\nSobre as informações do aluno, responda:")

    person["name"] = prompt("Nome:", lambda x: regexes.name.match(x))
    person["cpf"] = prompt("CPF:", lambda x: regexes.cpf.match(x))
    person["rg"] = prompt("RG:", lambda x: regexes.rg.match(x))
    person["birthdate"] = prompt("Data de nascimento (dd/mm/aaaa):", validate_date)

    student["cpf"] = person["cpf"]
    student["searching_home"] = parse_bool(
        prompt("Ele está procurando uma moradia? (s/n)", validate_bool)
    )
    student["searching_property"] = parse_bool(
        prompt("Ele está procurando um imóvel? (s/n)", validate_bool)
    )

    person["roles"] = Student(**student)
    ok, error = Person(**person).insert_db()

    if ok:
        print(f"O aluno {person['name']} foi cadastrado com sucesso!")
    else:
        print(f"Houve um erro no cadastro do aluno {person['name']}:")
        print(error)

    prompt_continue()
