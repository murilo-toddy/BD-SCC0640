from configparser import ConfigParser

import psycopg2


class Connection:
    """
    Singleton that sets up one connection to the Postgres database.

    ...
    Attributes
    ----------
    connection : psycopg2._psycopg.connection
    cursor : psycopg2._psycopg.cursor
    ...
    """

    # Guarantees the Connection class is a Singleton
    def __new__(cls):
        if not hasattr(cls, "instance"):
            cls.instance = super(Connection, cls).__new__(cls)

        return cls.instance

    def __init__(self):
        self.connection, self.cursor = self.__connect()

    def __config(self, filename="database.ini", section="postgresql") -> dict[str, str]:
        """
        Gets config info for a `.ini` file.

        ...
        Parameters
        ----------
        filename : str
        section : str
        ...
        """

        parser = ConfigParser()
        parser.read(filename)

        if not parser.has_section(section):
            raise Exception(f"Section {section} not found in {filename}.")

        # params = parser.items(section)
        # # return {param[0]: param[1] for param in params}

        return dict(parser.items(section))

    def __connect(
        self,
    ) -> tuple[psycopg2._psycopg.connection, psycopg2._psycopg.cursor]:
        """
        Connects to the database.
        """

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

    def disconnect(self) -> None:
        """
        Connects from the database.
        """

        if self.connection:
            self.connection.close()
            print("Connection closed")

    def exec_commit(self, command, *args):
        """
        Executes an SQL command and commits it.
        """
        self.cursor.execute(command, args)
        self.connection.commit()
