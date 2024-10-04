'''Классы для соединения(ConnectDB) и работы с MSSQL (MSSQLOperator)'''

import csv
import pyodbc
import SQL_Queries


class ConnectDB:
    @staticmethod
    def connect_to_db(server, database, user, password):
        ConnectionString = f'''DRIVER={{ODBC Driver 17 for SQL Server}};
                               SERVER={server};
                               DATABASE={database};
                               UID={user};
                               PWD={password}'''
        try:
            conn = pyodbc.connect(ConnectionString)
            conn.autocommit = True
        except pyodbc.ProgrammingError as ex:
            print(ex)
        else:
            return conn


class MSSQLOperator:

    def __init__(self, connector_obj):
        self.conn = connector_obj
        self.cursor = self.conn.cursor()

    def create_database(self, database_name, size=None, maxsize=None, filegrowth=None):
        SQL_COMMAND = SQL_Queries.create_database(database_name, size, maxsize, filegrowth)
        try:
            self.conn.execute(SQL_COMMAND)
        except pyodbc.ProgrammingError as ex:
            print(ex)
        else:
            return f"База данных {database_name} успешно создана"

    def create_table(self, database_name, table_name, sql_query):
        cursor = self.conn.cursor()
        cursor.execute(f'USE {database_name}')
        SQL_Query = sql_query(table_name)
        try:
            cursor.execute(SQL_Query)
        except pyodbc.ProgrammingError as ex:
            return ex
        else:
            return f"Таблица: {table_name} успешно создана"

    def drop_table(self, database_name, table_name, sql_query):
        cursor = self.conn.cursor()
        cursor.execute(f'USE {database_name}')
        SQL_Query = sql_query(table_name)
        try:
            cursor.execute(SQL_Query)
        except pyodbc.Error as ex:
            return ex
        else:
            return f"Таблица: {table_name} успешно удалена!"

    def fill_table(self, database_name, table_name, csv_data, sql_query):
        '''Заполняет созданные таблицы данными из csv-файла.'''
        self.cursor.execute(f"USE {database_name}")
        data_to_fill_list = csv_data
        try:
            for data_to_fill in data_to_fill_list:
                for k, v in data_to_fill.items():
                    '''Если в данных встречается апостроф - экранируем его'''
                    data_to_fill[k] = data_to_fill[k].replace("'", "''")
                self.cursor.execute(sql_query(table_name, data_to_fill))
        except pyodbc.Error as ex:
            return ex
        else:
            return f"Данные помещены в таблицу {table_name}"

    @staticmethod
    def csv_to_dict(filename):
        '''Метод переводящий данные из .csv в список all_data'''
        all_data = []
        with open(filename, encoding='utf-8') as file:
            data_full = csv.DictReader(file)
            for data in data_full:
                all_data.append(data)
        return all_data