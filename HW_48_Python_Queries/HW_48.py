import os
import pyodbc
from dotenv import load_dotenv
import SQL_Queries
import json


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


class DBManager:

    def __init__(self, connector_obj):
        self.conn = connector_obj
        self.cursor = self.conn.cursor()

    @staticmethod
    def save_data_to_json(data, filename):
        """Запись данных в json-файл. Будем все запросы писать в один файл
        Потому что запросов много, пусть ответы на них в одном месте лежат
        Зачем нам кучу файлов плодить? Хотя это не проблема, если надо"""
        with open(filename, 'a', encoding='utf-8') as file:
            json.dump(data, file, ensure_ascii=False, indent=4)

    def send_sql_query(self, db_name, sql_query):
        """Получаем имя БД и запрос(в нашем примере будем брать из
        файла SQL_Queries.py. Ответ на запрос добавляем в json-файл
        и возвращаем эти же данные"""
        try:
            self.cursor.execute(f"USE {db_name}")
            self.cursor.execute(sql_query)
            """Извлекаем название колонок и все строки. Это пришлось погуглить)"""
            columns = [column[0] for column in self.cursor.description]
            python_data = self.cursor.fetchall()
            """Преобразуем в список словарей, иначе он писал, что это тип Row
             и он не сериализовывается"""
            result = [dict(zip(columns, row)) for row in python_data]
            """Сохраняем(добавляем) в json-файл"""
            self.save_data_to_json(result, 'test.json')
            """result решил возвращать, если вдруг print'ом на него в 
            терминале захочется поглядеть"""
            return result
        except Exception as ex:
            print(ex)


if __name__ == "__main__":
    load_dotenv()
    SERVER = os.getenv('MS_SQL_SERVER')
    DATABASE = os.getenv('MS_SQL_DATABASE')
    USER = os.getenv('MS_SQL_USER')
    PASSWORD = os.getenv('MS_SQL_KEY')
    active_db = "FakeFitness"

    my_conn = ConnectDB.connect_to_db(SERVER, DATABASE, USER, PASSWORD)
    my_manager = DBManager(my_conn)
    """Ну и погнали все запросы задавать. Все ответы будут в test.json
    С помощью Принта возвращает ответ на запрос в терминал"""
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_EXISTS_1)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_EXISTS_2)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_ANY)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_SOME)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_ALL)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_ANY_ALL)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_UNION)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_UNION_ALL)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_JOIN)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_LEFT_JOIN)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_RIGHT_JOIN)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_FULL_JOIN)
    my_manager.send_sql_query(active_db, SQL_Queries.QUERY_LEFT_RIGHT_JOIN)

    my_conn.close()
