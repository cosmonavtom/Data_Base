-- Показать минимальную среднюю оценку по всем студентам (Не совсем понял, выведу кроме оценки ещё и ФулНейм)
SELECT FirstName + ' ' + LastName As FullName, [Min avg mark]
FROM StudentsInfo

-- Показать максимальную среднюю оценку по всем студентам
SELECT FirstName + ' ' + LastName As FullName, [Max avg mark]
FROM StudentsInfo

-- Показать статистику городов студентов. Нужно отображать название города и количество студентов
-- из этого города
SELECT DISTINCT City, COUNT(City) AS [Students]
FROM StudentsInfo
GROUP BY City

-- Показать статистику стран студентов. Нужно отображать название страны и количество
-- студентов из этой страны
SELECT DISTINCT Country, COUNT(Country) AS [Students]
FROM StudentsInfo
GROUP BY Country

-- Дальше запросы по последующим занятиям(ЕЩЁ НЕ ПРОХОДИЛИ!=))). Наверное нет смысла пихать их в эту работу