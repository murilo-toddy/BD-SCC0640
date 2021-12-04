import functionalities
import menu
from connection import Connection
from enums import PersonPermissions
from state import CurrentUser
from utils import prompt_menu

current_user = CurrentUser()

permissions: list[PersonPermissions] = current_user.fetch_permissions()


def permission_match(functionality):
    return bool([p for p in functionality["permissions"] if p.value in permissions])


print(
    f"Olá, {current_user.fetch_name().split(' ')[0]}! Tudo bem? Seja bem vind@ "
    + "ao Sistema de Monitoramento da Vida Universitária.",
    end="",
)

options = [func["option"] for func in menu.menu if permission_match(func)]
functions = [func["function"] for func in menu.menu if permission_match(func)] + [
    functionalities.quit
]

while True:
    print("\n\n---------------------------------------------------\n")
    if options:
        i = prompt_menu(options, menu.leading_text, menu.trailig_text, True)
        functions[i]()
    else:
        print(
            "Infelizmente você não possui nenhuma funcionalidade disponível.\nAté logo!\n"
        )
        break

Connection().disconnect()
