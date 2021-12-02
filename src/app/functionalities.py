from entities.people import Person, Professor, Student
from entities.transactions import RentContract, SaleContract
from state import CURRENT_CPF, get_current_user_data
from utils import (
    format,
    parse_bool,
    prompt,
    prompt_continue,
    regexes,
    validate_bool,
    validate_date,
)


def fetch_own_data():
    user = get_current_user_data()
    print(f"\n\nNome completo: {user['nome']}")
    print(f"CPF: {format(user['cpf'])}")
    print(f"RG: {format(user['rg'], 'rg')}")
    print(f"Data de nascimento: {format(user['nascimento'])}")
    print(f"Categorias: {format(user['atuacao'])}")

    if Student.__str__() in user["atuacao"]:
        print(f"Número de indicações acumuladas: {user['n_indicacoes']}")
    if Professor.__str__() in user["atuacao"]:
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


def fetch_rents_tenant():
    data = RentContract.query_by_tenant_join_residence(CURRENT_CPF)

    if not data:
        print("\nNenhum resultado encontrado.")
    else:
        print(
            "\nNo momento ainda não é possível ver as informações de cada "
            + "contrato com mais detalhes, mas essa funcionalidade está em "
            + "desenvolvimento!"
        )

        for i, d in enumerate(data):
            type = "moradia coletiva" if d["coletividade"] else "imóvel particular"

            print(f"\nDados da residência {i + 1}:")
            print(f" - Tipo: {type}")
            print(f" - Logradouro e número: {d['endereço']}")
            print(f" - Cidade: {d['cidade']}")
            print(f" - Estado: {format(d['estado'])}")
            print(f" - Condomínio: {d['condominio'] if d['condominio'] else 'N/A'}")
            print()
            print(f"Dados do contrato de aluguel {i + 1}:")
            print(f" - Responsável (nome): {d['responsavel_nome']}")
            print(f" - Responsável (CPF): {format(d['responsavel_cpf'])}")
            print(f" - Data de início: {format(d['inicio'])}")
            print(f" - Data de fim: {format(d['fim'])}")
            print(f" - Aluguel: {format(d['aluguel'])}")

            prompt_continue()


def fetch_sales_buyer():
    data = SaleContract.query_by_buyer_join_residence(CURRENT_CPF)

    if not data:
        print("\nNenhum resultado encontrado.")
    else:
        print(
            "\nNo momento ainda não é possível ver as informações de cada "
            + "contrato com mais detalhes, mas essa funcionalidade está em "
            + "desenvolvimento!"
        )

        for i, d in enumerate(data):
            print(f"\nDados do imóvel {i + 1}:")
            print(f" - Logradouro e número: {d['endereço']}")
            print(f" - Cidade: {d['cidade']}")
            print(f" - Estado: {format(d['estado'])}")
            print(f" - Condomínio: {d['condominio'] if d['condominio'] else 'N/A'}")
            print()
            print(f"Dados do contrato de venda {i + 1}:")
            print(f" - Responsável (nome): {d['responsavel_nome']}")
            print(f" - Responsável (CPF): {format(d['responsavel_cpf'])}")
            print(f" - Data da venda: {format(d['data'])}")
            print(f" - Valor: {format(d['valor'])}")

            prompt_continue()


def fetch_rents_responsible():
    data = RentContract.query_by_responsible_join_residence(CURRENT_CPF)

    if not data:
        print("\nNenhum resultado encontrado.")
    else:
        print(
            "\nNo momento ainda não é possível ver as informações de cada "
            + "contrato com mais detalhes, mas essa funcionalidade está em "
            + "desenvolvimento!"
        )

        for i, d in enumerate(data):
            type = "moradia coletiva" if d["coletividade"] else "imóvel particular"

            print(f"\nDados da residência {i + 1}:")
            print(f" - Tipo: {type}")
            print(f" - Logradouro e número: {d['endereço']}")
            print(f" - Cidade: {d['cidade']}")
            print(f" - Estado: {format(d['estado'])}")
            print(f" - Condomínio: {d['condominio'] if d['condominio'] else 'N/A'}")
            print()
            print(f"Dados do contrato de aluguel {i + 1}:")
            print(f" - Locatário (nome): {d['locatario_nome']}")
            print(f" - Locatário (CPF): {format(d['locatario_cpf'])}")
            print(f" - Data de início: {format(d['inicio'])}")
            print(f" - Data de fim: {format(d['fim'])}")
            print(f" - Aluguel: {format(d['aluguel'])}")

            prompt_continue()


def fetch_sales_responsible():
    data = SaleContract.query_by_responsible_join_residence(CURRENT_CPF)

    if not data:
        print("\nNenhum resultado encontrado.")
    else:
        print(
            "\nNo momento ainda não é possível ver as informações de cada "
            + "contrato com mais detalhes, mas essa funcionalidade está em "
            + "desenvolvimento!"
        )

        for i, d in enumerate(data):
            print(f"\nDados do imóvel {i + 1}:")
            print(f" - Logradouro e número: {d['endereço']}")
            print(f" - Cidade: {d['cidade']}")
            print(f" - Estado: {format(d['estado'])}")
            print()
            print(f"Dados do contrato de venda {i + 1}:")
            print(f" - Responsável (nome): {d['comprador_nome']}")
            print(f" - Responsável (CPF): {format(d['comprador_cpf'])}")
            print(f" - Data da venda: {format(d['data'])}")
            print(f" - Valor: {format(d['valor'])}")

            prompt_continue()
