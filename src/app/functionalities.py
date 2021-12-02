from entities.people import Person, Student
from utils import (
    parse_bool,
    prompt,
    prompt_continue,
    regexes,
    validate_bool,
    validate_date,
)


def register_student():
    person = {}
    student = {}

    print("Sobre as informações do aluno, responda:")

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
