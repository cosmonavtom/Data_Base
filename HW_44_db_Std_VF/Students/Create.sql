-- Приведение БД Students к 3ей нормальной форме

-- Делаю копию основной таблицы StudentsInfo, что бы не было как в прошлый раз...
SELECT * INTO BackupStudents From StudentsInfo;

/* Выношу столбцы City и Country в отдельную таблицу StudentsFrom и группирую по Country,
что в моей таблице скорее всего не надо, но теоретически полезною. Ну и что бы соответсвовать
признаку нормализации */
SELECT Country, COUNT(Country) AS CountContry, City
INTO StudentsFrom 
FROM StudentsInfo
GROUP BY Country, City;

-- Выношу контактные данные студентов в таблицу StudentContacts
SELECT [E-mail], Phone 
INTO StudentContacts
FROM StudentsInfo;

-- Делаем таблицу с Группами для студентов. Группируем по Группе =)
SELECT [Group], COUNT([Group]) AS QuantityStudents
INTO StudentGroups
FROM StudentsInfo
GROUP BY [Group];

-- Ну и выносим в отдельную таблицу оценки студентов
SELECT [Min avg mark], [Max avg mark], [Avg mark]
INTO StudentMarks
FROM StudentsInfo;

-- Самое страшное. Удаляю ненужные поля в основной таблице
ALTER TABLE StudentsInfo
DROP COLUMN City, Country, BirthDate, [E-mail], Phone, [Group],
	[Min avg mark], [Max avg mark], [Avg mark];


