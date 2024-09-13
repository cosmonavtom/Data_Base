-- Отображение всей информации из таблицы со студентами и оценками
SELECT * FROM StudentsInfo;

-- Отображение ФИО всех студентов
SELECT FirstName + ' ' + LastName AS FullName
FROM StudentsInfo;

-- Отображение всех средних оценок
SELECT [AVG Mark] FROM StudentsInfo;

-- Показать ФИО всех студентов с минимальной оценкой, больше, чем указанная (Пусть будет 3,5)
SELECT FirstName + ' ' + LastName AS FullName
FROM StudentsInfo
WHERE [Min avg mark] > 3.5;

-- Показать страны студентов. Названия стран должны быть уникальными
SELECT DISTINCT Country FROM StudentsInfo;

-- Показать города студентов. Названия городов должны быть уникальными
SELECT DISTINCT City FROM StudentsInfo;

-- Показать названия групп. Названия групп должны быть уникальными
SELECT DISTINCT [Group] FROM StudentsInfo;