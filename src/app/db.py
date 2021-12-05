from connection import Connection


class Database:
    """A manager interface for the system's database, with methods to CRUD data."""

    def __init__(self, connection=Connection()):
        self.__connection: Connection = connection

    def disconnect(self) -> None:
        self.__connection.disconnect()
