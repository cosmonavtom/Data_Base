/* 5 �������� � ��, ������� �� ������ ��������� ������ �� 2� � ����� ������ */

-- 1. ������� ������ ����� ��������� � �� ������, ����������� �� � ������
SELECT FirstName + ' ' + LastName AS FullName, Country
FROM StudentsInfo AS SI, StudentsFrom AS SF
WHERE SI.idStudentFrom = SF.id AND SF.Country <> 'Russia';

-- 2. ������� ������� ��������� ������ 20301 � ���� ������
SELECT LastName, [Group]
FROM  StudentsInfo AS SI, StudentGroups AS SG
WHERE SI.idStudenrGroups = SG.id AND SG.[Group] = '20301';

-- 3. ������� ������� � ���������� ������ ��������� 20123 ������. � ���� ������(��� ��������)
SELECT LastName, Phone, [Group]
FROM StudentsInfo AS SI, StudentGroups AS SG, StudentContacts AS SC
WHERE SI.idStudenrGroups = SG.id AND SI.idStudentsContacts = SC.id AND SG.[Group] = '20123';

-- 4. ������� ���� ��������� �� ������ � ������������� �� �� ������� ������ �� ��������. ������ ���� ����������
SELECT LastName + ' ' + FirstName AS FULLNAME, [Avg mark], Country
FROM StudentsInfo AS SI, StudentsFrom AS SF, StudentMarks AS SM
WHERE SI.idStudentFrom = SF.id AND SI.idStudentMarks = SM.id AND SF.Country = 'Russia'
ORDER BY [Avg mark] DESC

-- 5 ������� ������ ���������� � ���� ���������
SELECT SI.id, FirstName, LastName, [Group], [E-mail], Phone, Country, City, [Min avg mark], [Max avg mark], [Avg mark]
FROM StudentsInfo AS SI, StudentContacts AS SC, StudentGroups AS SG, StudentMarks AS SM, StudentsFrom AS SF
WHERE SI.idStudentFrom = SF.id AND SI.idStudentMarks = SM.id AND SI.idStudenrGroups = SG.id AND SI.idStudentsContacts = SC.id
