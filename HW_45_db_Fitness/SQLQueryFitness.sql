-- Вывести количество инструкторов по каждой секции
SELECT SectionName, COUNT(*) AS Instructors FROM Sections, Instructors
WHERE Sections.id = Instructors.SectionId
GROUP BY SectionName;

-- Показать количество людей, которые должны заниматься в определенный момент времени в каждой секции
/* Вот здесь чувствую, что не понял. Если надо будет поправлю запрос. Я показываю секцию, её время и
кол-во людей которые там записаны */
SELECT SectionName, StartPair, EndPair, COUNT(*) AS Visiters
FROM Sections, VisitTable
WHERE Sections.id = VisitTable.SectionId
GROUP BY SectionName, StartPair, EndPair;

-- Вывести количество посетителей фитнес клуба, которые пользуются услугами определенного мобильного оператора
/* Будем считать людей, которые пользуются условным оператором начинающимся на +333 */
SELECT COUNT(*) AS Operator_333 FROM Visiters
WHERE Phone LIKE '+333%';

-- Получить количество посетителей, у которых фамилия совпадает с фамилиями из определенного списка
/* Будем считать людей с фамилиями - Каява, Орейро, Иванов и Джугашвили */
SELECT COUNT(*) AS SomeLastName FROM Visiters
WHERE LastName IN ('Каява', 'Орейро', 'Иванов', 'Джугашвили');

-- Показать количество людей с одинаковыми именами, которых занимаются у определенного инструктора
/* Будем считать у инструктора по кроссфиту Петра Иванова*/
SELECT V.FirstName, COUNT(*) AS DistinctNames
FROM Visiters AS V, Instructors AS I, VisitTable AS VT, Sections AS S
WHERE V.VisitId = VT.id AND VT.SectionId = S.id AND I.SectionId = S.id 
	AND I.LastName = 'Иванов' AND I.FirstName = 'Пётр'
GROUP BY V.FirstName;

-- Получить информацию о людях, которые посетили фитнес зал минимальное количество раз
/* Насколько полную информацию не сказано, поэтому будем выводить Фамилию, Имя, Телефон 
и кол-во посещенных дней 5-х "минимальников" */
SELECT TOP 5 FirstName, LastName, Phone, DATEDIFF(day, FirstVisit, LastVisit) AS Day_of_visits
FROM Visiters, VisitTable
WHERE Visiters.VisitId = VisitTable.id
ORDER BY Day_of_visits; 

-- Вывести количество посетителей, которые занимались в определенной секции за первую половину текущего года
/* Если визитёр хотя бы день занимался в первой половине года в секции Аэробика, то мы его считаем */
SELECT COUNT(*) AS First_Half_Year
FROM Sections, VisitTable
WHERE VisitTable.SectionId = Sections.id AND SectionName = 'Аэробика'
	AND FirstVisit < '2024-07-01' AND LastVisit >= '2024-01-01';

-- Определить общее количество людей, посетивших фитнес зал за прошлый год
/* Фух, последний запрос. Было муторно*/
SELECT COUNT(*) AS Number_of_visiters_from_2023
FROM VisitTable
WHERE 2023 BETWEEN YEAR(FirstVisit) AND YEAR(LastVisit);

