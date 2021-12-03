import functionalities
from connection import Connection
from state import get_current_user_data
from utils import prompt_menu

name = get_current_user_data()["nome"].split(" ")[0]

print(
    f"Olá, {name}! Tudo bem? Seja bem vind@ ao Sistema de Monitoramento da "
    + "Vida Universitária.",
    end="",
)


menu_leading_text = (
    "Infelizmente, nem todas as funcionalidades estão disponíveis no momento, "
    + "devido ao sistema ainda estar em desenvolvimento. Quando ele for "
    + "concluído, mais funcionalidade serão disponibilizadas.\n"
    + "Selecione uma das opções do menu a seguir para continuar."
)
menu_trailig_text = (
    "\n\nPara selecionar, insira apenas o número da opção e, para sair, "
    + "insira -1. Input:"
)
menu_options = [
    "Visualizar um resumo dos seus dados.",
    "Cadastrar um novo aluno.",
    "Visualizar os contratos e residências que você já alugou.",
    "Visualizar os contratos e imóveis que você já comprou.",
    "Visualizar todas as festas para  as quais você comprou ingresso.",
    "Cadastrar uma nova residência pela qual você é responsável.",
    "Visualizar os contratos e residências pelos quais você já foi responsável.",
    "Visualizar os contratos e imóveis pelos quais você já foi responsável.",
    "Visualizar todas as residências pelas quais você é responsável.",
    "Visualizar as suas palestras.",
]
menu_functions = [
    functionalities.fetch_own_data,
    functionalities.register_student,
    functionalities.fetch_rents_tenant,
    functionalities.fetch_sales_buyer,
    functionalities.fetch_own_tickets,
    functionalities.register_new_residence,
    functionalities.fetch_rents_responsible,
    functionalities.fetch_sales_responsible,
    functionalities.fetch_responsible_residences,
    functionalities.fetch_own_talks,
    functionalities.quit,
]

while True:
    print("\n\n---------------------------------------------------\n")
    i = prompt_menu(menu_options, menu_leading_text, menu_trailig_text, True)
    menu_functions[i]()

Connection().disconnect()
