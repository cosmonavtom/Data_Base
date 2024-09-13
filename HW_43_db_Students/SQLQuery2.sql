-- Показать ФИО всех студентов с минимальной оценкой в указанном диапазоне(Пусть будет от 2 до 3 включительно)
SELECT FirstName + ' ' + LastName AS FullName
FROM StudentsInfo
WHERE [Min avg mark] >= 2 AND [Min avg mark] <= 3;

-- Показать информацию о студентах, которым исполнилось 20 лет
SELECT * FROM StudentsInfo
WHERE BirthDate < '2004-09-10';

-- Показать информацию о студентах с возрастом в указанном диапазоне (Пусть будет от 20 до 30)
SELECT * FROM StudentsInfo
WHERE BirthDate BETWEEN '1994-09-10' AND '2004-09-10';

-- Показать информацию о студентах с конкретным именем. Например, показать студентов с именем Борис
SELECT * FROM StudentsInfo
WHERE FirstName = 'Boris';

-- Показать информацию о студентах, в чьем номере встречаются три семерки
SELECT * FROM StudentsInfo
WHERE Phone LIKE '%7%7%7%';

-- Показать электронные адреса студентов, начинающихся с конкретной буквы (Пусть будет 'a')
SELECT [E-mail] FROM StudentsInfo
WHERE [E-mail] LIKE 'a%';
