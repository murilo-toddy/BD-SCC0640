from connection import Connection


def insert_person(connection, person):
    # Insere uma nova pessoa
    sql = """INSERT INTO pessoa(CPF,RG,nome,nascimento)
             VALUES(%s, %s, %s, TO_DATE(%s, 'DD/MM/YYYY'));"""

    # execute the INSERT statement
    connection.cursor.execute(
        sql, (person["cpf"], person["rg"], person["nome"], person["nascimento"])
    )
    connection.connection.commit()


if __name__ == "__main__":
    connection = Connection()

    person = {
        "cpf": "11471634990",
        "rg": "137229919",
        "nome": "tod",
        "nascimento": "27/08/2001",
        "att": "Professor",
    }

    insert_person(Connection, person)

    Connection.disconnect()
