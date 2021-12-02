from entities.people import Person

CURRENT_CPF = "61520188030"


def get_current_user_data():
    return Person.query_by_cpf_join_specializations(CURRENT_CPF)
