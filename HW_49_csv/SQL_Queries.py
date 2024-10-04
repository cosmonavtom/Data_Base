''' Запросы для задания. Создание БД, создание и заполнение трёх разных таблиц
и удаления таблиц для теста. В принципе по названию всё понятно
'''


def create_database(name, size, maxsize, filegrowth):
    COMMAND = fr"""
CREATE DATABASE {name}
ON
(
NAME = {name}Database_data,
FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\{name}Database_data.mdf',
SIZE = {size}MB,
MAXSIZE = {maxsize}GB,
FILEGROWTH={filegrowth}
)
LOG ON
(NAME = {name}Database_log,
FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\{name}Database_data.ldf',
SIZE = {size}MB,
MAXSIZE = {str(round(int(maxsize) * 0.1))}GB,
FILEGROWTH = {filegrowth}
)"""
    return COMMAND


def create_customers_data(table_name):
    QUERY = fr"""CREATE TABLE {table_name}
            (customer_id  nvarchar(10) PRIMARY KEY,
            company_name nvarchar(100) NOT NULL,
            contact_name nvarchar(50) NOT NULL);"""
    return QUERY


def fill_customers(table_name, data_to_fill):
    QUERY = fr"""INSERT INTO {table_name} (customer_id, company_name, contact_name)
                        VALUES
                        ('{data_to_fill['customer_id']}',
                         '{data_to_fill['company_name']}',
                         '{data_to_fill['contact_name']}');"""
    return QUERY


def create_employees_data(table_name):
    QUERY = fr"""CREATE TABLE {table_name}
            (employee_id INT PRIMARY KEY IDENTITY(1,1),
            first_name nvarchar(100) NOT NULL,
            last_name nvarchar(100) NOT NULL,
            title nvarchar(100) NOT NULL,
            birth_date date NOT NULL,
            notes nvarchar(1000) NOT NULL);"""
    return QUERY


def fill_employees(table_name, data_to_fill):
    QUERY = fr"""INSERT INTO {table_name} (first_name, last_name, title, birth_date, notes)
                            VALUES
                             ('{data_to_fill['first_name']}',
                             '{data_to_fill['last_name']}',
                             '{data_to_fill['title']}',
                             '{data_to_fill['birth_date']}',
                             '{data_to_fill['notes']}');"""
    return QUERY


def create_orders_data(table_name):
    QUERY = fr"""CREATE TABLE {table_name}
            (order_id int PRIMARY KEY,
            customer_id nvarchar(10) NOT NULL,
            employee_id int NOT NULL,
            order_date date NOT NULL,
            ship_city nvarchar(100) NOT NULL);"""
    return QUERY


def fill_orders(table_name, data_to_fill):
    QUERY = fr"""INSERT INTO {table_name} (order_id, customer_id, employee_id, order_date, ship_city)
                            VALUES
                            ('{data_to_fill['order_id']}',
                             '{data_to_fill['customer_id']}',
                             '{data_to_fill['employee_id']}',
                             '{data_to_fill['order_date']}',
                             '{data_to_fill['ship_city']}');"""
    return QUERY


def drop_table(table_name):
    QUERY = fr"DROP TABLE {table_name}"
    return QUERY
