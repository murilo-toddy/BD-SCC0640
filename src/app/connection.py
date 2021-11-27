from configparser import ConfigParser

import psycopg2


class Connection:
    def __init__(self):
        self.connection, self.cursor = self.connect()

    def __config(self, filename="database.ini", section="postgresql"):
        parser = ConfigParser()
        parser.read(filename)

        if not parser.has_section(section):
            raise Exception(f"Section {section} not found in {filename}.")

        # params = parser.items(section)
        # # return {param[0]: param[1] for param in params}

        return dict(parser.items(section))

    def connect(self):
        params = self.__config()

        # connects to the database
        print("Connecting to the PostgreSQL database...")
        connection = psycopg2.connect(**params)

        # create a cursor
        cursor = connection.cursor()

        # TODO: remove this after development
        # displays the db server's version
        print("PostgreSQL database version:")
        cursor.execute("SELECT version()")
        print(cursor.fetchone())

        return connection, cursor

    def disconnect(self):
        if self.connection:
            self.connection.close()
            print("Connection closed")
