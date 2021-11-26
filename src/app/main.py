import psycopg2
from connection import config

# Conectar ao PostgreSQL
def connect():
    conn = None
    try:
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
		
        # create a cursor
        cur = conn.cursor()
        
	    # execute a statement
        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)
        
        return [conn, cur]
    
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)


# Encerrar conexão
def disconnect(conn):
    if conn is not None:
        conn.close()
        print("Connection closed")



def insert_person(conn, cur, person):
    # Insere uma nova pessoa
    sql = """INSERT INTO pessoa(CPF,RG,nome,nascimento)
             VALUES(%s, %s, %s, TO_DATE(%s, 'DD/MM/YYYY'));"""

    # execute the INSERT statement
    cur.execute(sql, (person["cpf"], person["rg"], person["nome"],
                person["nascimento"]))
    conn.commit()




if __name__ == '__main__':
    [conn, cur] = connect()

    person = {
        "cpf": "11471634990",
        "rg":  "137229919",
        "nome": "tod",
        "nascimento": "27/08/2001",
        "att": "Professor",
    }

    insert_person(conn, cur, person)

    disconnect(conn)
    