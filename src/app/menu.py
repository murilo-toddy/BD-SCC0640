import functionalities
from enums import PersonPermissions

leading_text = (
    "Infelizmente, nem todas as funcionalidades estão disponíveis no momento, "
    + "devido ao sistema ainda estar em desenvolvimento. Quando ele for "
    + "concluído, mais funcionalidade serão disponibilizadas.\n"
    + "Selecione uma das opções do menu a seguir para continuar."
)

menu = [
    {
        "option": "Visualizar um resumo dos seus dados.",
        "function": functionalities.fetch_own_data,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Cadastrar um novo aluno.",
        "function": functionalities.register_student,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Visualizar os contratos e residências que você já alugou.",
        "function": functionalities.fetch_rents_tenant,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Visualizar os contratos e imóveis que você já comprou.",
        "function": functionalities.fetch_sales_buyer,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Visualizar todas as festas com ingressos disponíveis em uma determinada cidade.",
        "function": functionalities.fetch_parties_in_city,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Visualizar todas as festas para as quais você comprou ingresso.",
        "function": functionalities.fetch_own_tickets,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Cadastrar uma nova residência pela qual você é responsável.",
        "function": functionalities.register_new_residence,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Visualizar os contratos e residências pelos quais você já foi responsável.",
        "function": functionalities.fetch_rents_responsible,
        "permissions": (PersonPermissions.Responsible,),
    },
    {
        "option": "Visualizar os contratos e imóveis pelos quais você já foi responsável.",
        "function": functionalities.fetch_sales_responsible,
        "permissions": (PersonPermissions.Responsible,),
    },
    {
        "option": "Visualizar todas as residências pelas quais você é responsável.",
        "function": functionalities.fetch_responsible_residences,
        "permissions": (PersonPermissions.Responsible,),
    },
    {
        "option": "Visualizar as suas palestras.",
        "function": functionalities.fetch_own_talks,
        "permissions": (PersonPermissions.Professor,),
    },
    {
        "option": "Trocar de conta.",
        "function": functionalities.logout,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
    {
        "option": "Sair.",
        "function": functionalities.quit,
        "permissions": (
            PersonPermissions.Professor,
            PersonPermissions.Responsible,
            PersonPermissions.Student,
        ),
    },
]
