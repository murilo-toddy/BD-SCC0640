import functionalities
import menu
from connection import Connection
from enums import PersonPermissions
from state import CurrentUser
from utils import prompt, prompt_menu, regexes

cpf = prompt(
    "\nOlá! Tudo bem?\nPara continuar, for favor, forneça o seu CPF:",
    regexes.cpf.match,
)

try:
    current_user = CurrentUser(cpf)
except Exception as error:
    current_user = None
    print("\nHouve um erro!", error, end="\n\n")

if current_user:
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
