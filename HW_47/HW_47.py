import os
import pyodbc
from dotenv import load_dotenv

load_dotenv()
USER = os.getenv('MS_SQL_USER')
SERVER = os.getenv('MS_SQL_SERVER')
DATABASE = os.getenv('MS_SQL_DATABASE')
PASSWORD = os.getenv('MS_SQL_KEY')

connectionString = f'''DRIVER={{ODBC Driver 17 for SQL Server}};
                       SERVER={SERVER};
                       DATABASE={DATABASE};                       
                       UID={USER};                       
                       PWD={PASSWORD}'''

# Запрос на создание БД
SQL_COMMAND = r'''
CREATE DATABASE Animals
ON
(NAME = AnimalsDatabase_data,
FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AnimalsDatabase_data.mdf',
SIZE = 8 MB,
MAXSIZE = 100 MB,
FILEGROWTH = 5%
)
LOG ON
(NAME = AnimalsDatabase_log,
FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AnimalsDatabase_data.ldf',
SIZE = 5 MB,
MAXSIZE = 20 MB,
FILEGROWTH = 5%
);'''

# Запрос на создание таблицы
SQL_QUERY = r'''
CREATE TABLE Animals.dbo.animals
(id int PRIMARY KEY,
Type nvarchar(50),
Name nvarchar(50));
'''

# Заполнение таблицы
SQL_QUERY_INTO = r'''
INSERT INTO Animals.dbo.animals(id, Type, Name)
VALUES
(1, 'Fox', 'Alisa'),
(2, 'Cat', 'Basilio'),
(3, 'Turtle', 'Tortilla'),
(4, 'Dog', 'Artemon'),
(5, 'Rat', 'Shushara');
'''

#  Запрос на вывод данных из БД
SQL_QUERY_INFO = r'''
SELECT id, Type, Name
FROM Animals.dbo.animals;
'''

conn = pyodbc.connect(connectionString)
conn.autocommit = True
cursor = conn.cursor()
try:
    cursor.execute((SQL_COMMAND))
except pyodbc.Error as ex:
    print(ex)
else:
    print('Database Created')
finally:
    conn.close()

conn = pyodbc.connect(connectionString)
conn.autocommit = True
cursor = conn.cursor()
try:
    cursor.execute(SQL_QUERY)
except pyodbc.Error as ex:
    print(ex)
else:
    print('Table Created')
finally:
    conn.close()

conn = pyodbc.connect(connectionString)
conn.autocommit = True
cursor = conn.cursor()
try:
    cursor.execute(SQL_QUERY_INTO)
except pyodbc.Error as ex:
    print(ex)
else:
    print('Data Inserted')
finally:
    conn.close()

conn = pyodbc.connect(connectionString)
conn.autocommit = True
cursor = conn.cursor()
data_list = []
try:
    result = cursor.execute(SQL_QUERY_INFO)
except pyodbc.Error as ex:
    print(ex)
else:
    records = result.fetchall()
    print(f'\nВыводим данные в "табличном" виде:')
    for record in records:
        print(f'{record.id}\t{record.Type}\t{record.Name}')
        data_dict = {'id':{record.id}, 'Type': {record.Type}, 'Name': {record.Name}}
        data_list.append(data_dict)
finally:
    conn.close()

print(f'\nВыводим данные уже из созданного словаря:')
for data in data_list:
    print(data)