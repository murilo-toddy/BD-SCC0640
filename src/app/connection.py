from configparser import ConfigParser

import psycopg2
import psycopg2.extras


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

    def __init__(self, debug=False):
        self.__debug = debug
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
    ) -> tuple[psycopg2._psycopg.connection, psycopg2.extras.DictCursor]:
        """
        Connects to the database.
        """

        params = self.__config()

        # connects to the database
        if self.__debug:
            print("Connecting to the PostgreSQL database...")
        connection = psycopg2.connect(**params)

        # create a cursor
        cursor = connection.cursor(cursor_factory=psycopg2.extras.RealDictCursor)

        # displays the db server's version
        if self.__debug:
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
            if self.__debug:
                print("Connection closed")

    def exec_commit(self, command: str, *args, cb: callable = None) -> any:
        """
        Executes an SQL command and commits it.

        Parameters
        ----------
        command : str
            SQL command to be executed.
        args : tuple[any]
            Parameters to `command`.
        cb : function = None
            Function that'll be called before the commit. The cursor'll be
            passed to it as argument.

        Returns
        -------
        any : the return value of `cb` or `None`.
        """
        self.cursor.execute(command, args)
        return_value = cb(self.cursor) if cb else None
        self.connection.commit()

        return return_value
