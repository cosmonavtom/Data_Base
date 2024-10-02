# -- 1. Два запроса Exists
# -- Выбрать всех посетителей Аэробики

QUERY_EXISTS_1 = fr"""SELECT FirstName, LastName FROM Visiters
            WHERE EXISTS (SELECT * FROM VisitTable
	        WHERE Visiters.id = VisitTable.id AND VisitTable.SectionId = 1);"""

# -- Выбрать всех инструкторов, которые НЕ преподают Аэробику, Шейпинг и Кроссфит
QUERY_EXISTS_2 = r"""SELECT FirstName, LastName FROM Instructors
            WHERE NOT EXISTS (SELECT * FROM Sections
	        WHERE Instructors.SectionId = Sections.id 
	        AND Sections.SectionName IN ('Аэробика', 'Шейпинг', 'Кроссфит'));"""

# -- 2. По одному запросу на ANY/SOME (разных а не просто заменить ANY на SOME)
# -- Выбрать всех посетителей, которые пришли в клуб в 2022 году
QUERY_ANY = r"""SELECT FirstName, LastName FROM Visiters
            WHERE id = ANY(SELECT id FROM VisitTable
	        WHERE YEAR(FirstVisit) = 2022);"""

# -- Какие преподователи заняты в 10:00?
QUERY_SOME = r"""SELECT FirstName, LastName FROM Instructors
            WHERE SectionId = (SELECT id FROM Sections 
	        WHERE id = SOME(SELECT SectionId FROM VisitTable		
		    WHERE '10:00:00' BETWEEN StartPair AND EndPair));"""

# -- 3. Один запрос ALL
# -- Вывести всех посетителей с длиной имени меньше средней по больнице. Ничего умнее не придумал =(
QUERY_ALL = r"""SELECT FirstName, LastName FROM Visiters
            WHERE Len(FirstName) < ALL (SELECT AVG(LEN(FirstName)) FROM Visiters);"""

# -- 4. Один запрос на сочетание ANY/SOME, ALL
# -- Вывести всех посетителей с длиной фамилии больше средней, но не с самыми длинными именами (понимаю, что чушь=))
QUERY_ANY_ALL = r"""SELECT FirstName, LastName FROM Visiters, VisitTable
                WHERE Visiters.VisitId = VisitTable.id AND Len(LastName) > ALL(SELECT AVG(LEN(LastName)) FROM Visiters)
	            AND LEN(FirstName) < ANY(SELECT LEN(FirstName) FROM Visiters);"""

# -- 5. Один запрос на UNION
# -- Вывести уникальные имена всех инструкторов и посетителей
QUERY_UNION = r"""SELECT FirstName FROM Visiters
                UNION
                SELECT FirstName FROM Instructors;"""

# -- 6. Один запрос на UNION ALL
# -- Вывести id, имена всех инстукторов и посетителей с пометкой кто это и отсортированных по имени.
QUERY_UNION_ALL = r"""SELECT id, FirstName, 'Visiter' AS 'Who is this' FROM Visiters
                UNION ALL
                SELECT id, FirstName, 'Instructor' AS 'Who is this' FROM Instructors
                ORDER BY FirstName;"""

# -- 7. По одному запросу на все JOIN(INNER/LEFT/RIGHT/LEFT+RIGHT/FULL) - всего пять штук
# -- INNER JOIN. Выести инфу об инструкторах преподающих Пилатес и Бодифлекс
QUERY_JOIN = r"""SELECT LastName + ' ' + FirstName AS FullName, Phone FROM Instructors
                INNER JOIN Sections ON Instructors.SectionId = Sections.id
                WHERE SectionName IN ('Пилатес', 'Бодифлекс')"""

# -- LEFT JOIN. Вывести всех визитеров и их последний визит даже если ещё не начали ходить
QUERY_LEFT_JOIN = r"""SELECT FirstName, LastName, VisitTable.LastVisit FROM Visiters
                LEFT JOIN VisitTable ON Visiters.VisitId = VisitTable.id;"""

# -- RIGHT JOIN. Вывести инструкторов и все секции, даже если у некоторых секций нет инструкторов
QUERY_RIGHT_JOIN = r"""SELECT LastName, FirstName, Sections.SectionName FROM Instructors
                RiGHT JOIN Sections ON Instructors.SectionId = Sections.id;"""

# -- FULL JOIN. Вывести инструкторов и все секции, даже если у кого-то нет "пары"
QUERY_FULL_JOIN = r"""SELECT LastName, FirstName, Sections.SectionName FROM Instructors
                FULL JOIN Sections ON Instructors.SectionId = Sections.id;"""

# -- LEFT + RIGHT JOIN. Вывести все секции и инстукторов которые там работают и всех посетителей и их секции
QUERY_LEFT_RIGHT_JOIN = r"""SELECT LastName, FirstName, Sections.SectionName  FROM Instructors
                RIGHT JOIN Sections ON Instructors.SectionId = Sections.id
                UNION ALL
                SELECT FirstName, LastName,  Sections.SectionName FROM Visiters, VisitTable
                LEFT JOIN Sections ON VisitTable.SectionId = Sections.id
                WHERE Visiters.VisitId = VisitTable.id;"""