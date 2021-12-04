from connection import Connection
from entities.parties import Ticket
from entities.people import Person, Professor, Student
from entities.residences import Home, Property, Residence, Responsability
from entities.transactions import RentContract, SaleContract
from entities.university import Talks
from enums import State
from models import Address
from state import CurrentUser
from utils import (
    format,
    parse_bool,
    parse_float,
    prompt,
    prompt_continue,
    regexes,
    validate_bool,
    validate_date,
    validate_float,
)

current_user = CurrentUser()


def fetch_own_data():
    user = current_user.fetch_data()
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
    student["indicator"] = current_user.get_cpf()

    person["roles"] = Student(**student)
    ok, error = Person(**person).insert_db()

    if ok:
        print(f"O aluno {person['name']} foi cadastrado com sucesso!")
    else:
        print(f"Houve um erro no cadastro do aluno {person['name']}:")
        print(error)

    prompt_continue()


def fetch_rents_tenant():
    data = RentContract.query_by_tenant_join_residence(current_user.get_cpf())

    if not data:
        print("\nNenhum resultado encontrado.")
        prompt_continue()
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
    data = SaleContract.query_by_buyer_join_residence(current_user.get_cpf())

    if not data:
        print("\nNenhum resultado encontrado.")
        prompt_continue()
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
    data = RentContract.query_by_responsible_join_residence(current_user.get_cpf())

    if not data:
        print("\nNenhum resultado encontrado.")
        prompt_continue()
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
    data = SaleContract.query_by_responsible_join_residence(current_user.get_cpf())

    if not data:
        print("\nNenhum resultado encontrado.")
        prompt_continue()
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


def fetch_responsible_residences():
    data = Responsability.query_by_responsible_join_residence(current_user.get_cpf())

    if not data:
        print("\nNenhum resultado encontrado.")
        prompt_continue()
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
            print(f" - Aluguel: {format(d['aluguel'])}")

            if d["coletividade"]:
                print(f" - Número de moradores: {d['n_moradores']}")
            else:
                print(f" - Condomínio: {d['condominio'] if d['condominio'] else 'N/A'}")
                if d["permissao_venda"]:
                    print(f" - Valor de venda: {format(d['valor_venda'])}")

            prompt_continue()


def register_new_residence():
    residence = {"address": {}}
    specialization = {}

    print("\n\nSobre as informações da residência, responda:")

    residence["address"]["address"] = prompt("Logradouro:", regexes.name.match)
    residence["address"]["address"] += f", {prompt('Número:', lambda x: x.isdigit())}"
    residence["address"]["city"] = prompt("Cidade:", lambda x: x)
    residence["address"]["state"] = prompt("Estado (sigla):", lambda x: x in State)
    residence["address"]["cep"] = prompt("CEP:", regexes.cep.match)
    residence["rent"] = parse_float(prompt("Aluguel: R$", validate_float))
    residence["n_rooms"] = prompt("Número de quartos:", lambda x: x.isdigit())
    residence["n_bathrooms"] = prompt("Número de banheiros:", lambda x: x.isdigit())
    residence["inner_area"] = prompt("Área interna (m²):", lambda x: x.isdigit())
    residence["outer_area"] = prompt("Área externa (m²):", lambda x: x.isdigit())
    residence["extra_info"] = prompt("Informações adicionais:")

    residence["address"] = Address(**residence["address"])
    residence["responsible"] = current_user.get_cpf()

    type = prompt(
        "Tipo de residência (moradia x imóvel):",
        lambda x: x.lower() in ["moradia", "imóvel", "imovel"],
    )
    coletivity = type.lower() == "moradia"

    if coletivity:
        specialization["n_residents"] = prompt(
            "Número de moradores:", lambda x: x.isdigit()
        )
        specialization["n_roomates"] = prompt(
            "Número de colegas de quarto:", lambda x: x.isdigit()
        )
        specialization["n_pets"] = prompt("Número de pets:", lambda x: x.isdigit())
        specialization["total_capacity"] = prompt(
            "Número total de vagas:", lambda x: x.isdigit()
        )
        residence["specialization"] = Home(**specialization)
    else:
        specialization["value"] = parse_float(
            prompt("Valor de Venda: R$", validate_float)
        )
        specialization["condominium"] = parse_float(
            prompt("Condomínio: R$", validate_float)
        )
        specialization["allow_pets"] = parse_bool(
            prompt("O condomínio permite pets? (s/n)", validate_bool)
        )
        residence["specialization"] = Property(**specialization)

    ok, error = Residence(**residence).insert_db()

    if ok:
        print("\nA residência foi cadastrada com sucesso!")
    else:
        print("\nHouve um erro no cadastro da residência:")
        print(error)

    prompt_continue()


def fetch_own_talks():
    data = Talks.fetch_by_professor_join_campus(current_user.get_cpf())

    if not data:
        print("\nNenhum resultado encontrado.")
        prompt_continue()
    else:
        print(
            "\nNo momento ainda não é possível ver as informações de cada "
            + "palestra com mais detalhes, mas essa funcionalidade está em "
            + "desenvolvimento!"
        )

        for i, d in enumerate(data):
            print(f"\nDados da palestra {i + 1}:")
            print(f" - Título: {d['nome']}")
            print(f" - Tema: {d['tema']}")
            print(f" - Data/Horário: {format(d['data_horario'], 'data_horario')}")
            print(f" - Campus: {d['campus']} - {d['universidade']}")
            print(f" - Cidade: {d['cidade']} - {d['estado']}")

            prompt_continue()


def fetch_own_tickets():
    data = Ticket.fetch_by_buyer_join_party_city(current_user.get_cpf())

    if not data:
        print("\nNenhum resultado encontrado.")
        prompt_continue()
    else:
        print(
            "\nNo momento ainda não é possível ver as informações de cada "
            + "ingresso com mais detalhes, mas essa funcionalidade está em "
            + "desenvolvimento!"
        )

        for i, d in enumerate(data):
            print(f"\nDados do ingresso/festa {i + 1}:")
            print(f" - Nome da festa: {d['nome']}")
            print(f" - Data/Horário: {format(d['data_horario'], 'data_horario')}")
            print(f" - Cidade: {d['cidade']} - {d['estado']}")
            print(f" - Preço: {format(d['preço'])}")

            prompt_continue()


def quit():
    print("\n\nAté logo!")
    prompt_continue()
    print()
    Connection().disconnect()
    exit()


def login(new: bool = True) -> CurrentUser:
    def validate_login(cpf):
        try:
            CurrentUser(cpf)
        except Exception:
            return False
        else:
            return True

    cpf = prompt(
        "\nPara continuar, for favor, forneça o seu CPF:",
        validate_login,
        "O CPF é inválido ou o usuário não existe.",
    )

    current_user = CurrentUser(cpf)

    name = current_user.fetch_name().split(" ")[0]
    print(
        f"\nOlá, {name}! Tudo bem? Seja bem vind@ ao Sistema de "
        + "Monitoramento da Vida Universitária.",
    )
    prompt_continue()

    return current_user


def logout():
    print("\n\n\n\n---------------------------------------------------\n")
    login()
    return True
