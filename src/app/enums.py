from enum import Enum


class PersonRole(Enum):
    """
    All roles a person can have: `Student`, `Professor`, `Responsible`.
    """

    Student = "aluno"
    Professor = "professor"
    Responsible = "responsavel"
