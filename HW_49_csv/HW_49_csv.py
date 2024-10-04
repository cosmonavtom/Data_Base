import os
from dotenv import load_dotenv
import SQL_Queries
import Module as M


if __name__ == "__main__":
    load_dotenv()
    SERVER = os.getenv('MS_SQL_SERVER')
    DATABASE = os.getenv('MS_SQL_DATABASE')
    USER = os.getenv('MS_SQL_USER')
    PASSWORD = os.getenv('MS_SQL_KEY')
    new_db = "NorthWind"
    active_db = "NorthWind"

    my_conn = M.ConnectDB.connect_to_db(SERVER, DATABASE, USER, PASSWORD)
    my_db_operator = M.MSSQLOperator(my_conn)

    # Создаём БД NorthWind
    print(my_db_operator.create_database(new_db, "10", "20", "5%"))

    # Тестовые запросы, удаляют таблицы
    # my_db_operator.drop_table(active_db, "customers_data", SQL_Queries.drop_table)
    # my_db_operator.drop_table(active_db, "employees_data", SQL_Queries.drop_table)
    # my_db_operator.drop_table(active_db, "orders_data", SQL_Queries.drop_table)

    # Создаём таблицу customers и заполняем её
    print(my_db_operator.create_table(active_db, "customers_data", SQL_Queries.create_customers_data))
    print(my_db_operator.fill_table(active_db, 'customers_data',
                                    M.MSSQLOperator.csv_to_dict(r'north_data/customers_data.csv'),
                                    SQL_Queries.fill_customers))

    # Создаём таблицу employees и заполняем её
    print(my_db_operator.create_table(active_db, "employees_data", SQL_Queries.create_employees_data))
    print(my_db_operator.fill_table(active_db, 'employees_data',
                                    M.MSSQLOperator.csv_to_dict(r'north_data/employees_data.csv'),
                                    SQL_Queries.fill_employees))

    # Создаём таблицу orders и заполняем её
    print(my_db_operator.create_table(active_db, "orders_data", SQL_Queries.create_orders_data))
    print(my_db_operator.fill_table(active_db, "orders_data",
                                    M.MSSQLOperator.csv_to_dict(r'north_data/orders_data.csv'),
                                    SQL_Queries.fill_orders))
