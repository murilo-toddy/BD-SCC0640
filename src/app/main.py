from connection import Connection
import functionalities
from utils import prompt_menu
from state import get_current_user_data


name = get_current_user_data()['nome'].split(' ')[0]

print(f"Olá, {name}! Tudo bem? Seja bem vind@ ao Sistema de Monitoramento da \
Vida Universitária.\n")


menu_leading_text = (
    "Infelizmente, nem todas as funcionalidades estão disponíveis no momento,"
    + " devido ao sistema ainda estar em desenvolvimento. Quando ele for "
    + "concluído, mais funcionalidade serão disponibilizadas.\n"
)
menu_options = [
    "Visualizar um resumo dos seus dados.",
    "Cadastrar um novo aluno.",
    "Visualizar os contratos e residências que você já alugou.",
    "Visualizar os contratos e imóveis que você já comprou.",
    "Comprar ingresso para uma festa em sua cidade.",
    "Visualizar todas as festas para  as quais você comprou ingresso.",
    "Cadastrar uma nova residência pela qual você é responsável.",
    "Visualizar os contratos e residências pelos quais você já foi responsável.",
    "Visualizar os contratos e imóveis pelos quais você já foi responsável.",
    "Visualizar todas as residências pelas quais você é responsável.",
    "Gerenciar os alunos que orienta.",
    "Visualizar as suas palestras.",
]
menu_functions = [
    functionalities.fetch_own_data,
    functionalities.register_student,
    functionalities.fetch_rents_tenant,
    functionalities.fetch_sales_buyer,
    functionalities.buy_ticket_to_party,
    functionalities.fetch_own_tickets,
    functionalities.register_new_residence,
    functionalities.fetch_rents_responsible,
    functionalities.fetch_sales_responsible,
    functionalities.fetch_responsible_residences,
    functionalities.manage_students,
    functionalities.fetch_own_talks,
]

while True:
    print("\n\n---------------------------------------------------\n")
    i = prompt_menu(menu_options, menu_leading_text)
    menu_functions[i]()

Connection().disconnect()
