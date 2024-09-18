/* 5 запросов к БД, которые бы вывели результат взятый из 2х и более таблиц */

-- 1. Вывести полные имена студентов и их страны, проживающих НЕ в России
SELECT FirstName + ' ' + LastName AS FullName, Country
FROM StudentsInfo AS SI, StudentsFrom AS SF
WHERE SI.idStudentFrom = SF.id AND SF.Country <> 'Russia';

-- 2. Вывести фамилии студентов группы 20301 и саму группу
SELECT LastName, [Group]
FROM  StudentsInfo AS SI, StudentGroups AS SG
WHERE SI.idStudenrGroups = SG.id AND SG.[Group] = '20301';

-- 3. Вывести фамилии и телефонные номера студентов 20123 группы. И саму группу(для проверки)
SELECT LastName, Phone, [Group]
FROM StudentsInfo AS SI, StudentGroups AS SG, StudentContacts AS SC
WHERE SI.idStudenrGroups = SG.id AND SI.idStudentsContacts = SC.id AND SG.[Group] = '20123';

-- 4. Вывести всех студентов из России и отсортировать их по средней оценке по убыванию. Страну тоже отображать
SELECT LastName + ' ' + FirstName AS FULLNAME, [Avg mark], Country
FROM StudentsInfo AS SI, StudentsFrom AS SF, StudentMarks AS SM
WHERE SI.idStudentFrom = SF.id AND SI.idStudentMarks = SM.id AND SF.Country = 'Russia'
ORDER BY [Avg mark] DESC

-- 5 Вывести полную информацию о всех студентах
SELECT SI.id, FirstName, LastName, [Group], [E-mail], Phone, Country, City, [Min avg mark], [Max avg mark], [Avg mark]
FROM StudentsInfo AS SI, StudentContacts AS SC, StudentGroups AS SG, StudentMarks AS SM, StudentsFrom AS SF
WHERE SI.idStudentFrom = SF.id AND SI.idStudentMarks = SM.id AND SI.idStudenrGroups = SG.id AND SI.idStudentsContacts = SC.id
