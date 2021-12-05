import functionalities
import menu
from connection import Connection
from enums import PersonPermissions
from state import CurrentUser
from utils import prompt_menu

functionalities.login()


def setup_menu():
    current_user = CurrentUser()
    permissions: list[PersonPermissions] = current_user.fetch_permissions()

    def permission_match(functionality):
        return bool([p for p in functionality["permissions"] if p.value in permissions])

    options = [func["option"] for func in menu.menu if permission_match(func)]
    functions = [func["function"] for func in menu.menu if permission_match(func)]

    return options, functions


options, functions = setup_menu()


while True:
    print("\n\n---------------------------------------------------\n")
    if options:
        i = prompt_menu(options, menu.leading_text)
        shuld_refresh = functions[i]()

        if shuld_refresh:
            options, functions = setup_menu()
    else:
        print("Infelizmente você não possui nenhuma funcionalidade disponível.")
        functionalities.quit()

Connection().disconnect()
