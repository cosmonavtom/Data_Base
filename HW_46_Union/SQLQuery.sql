-- 1. ��� ������� Exists
-- ������� ���� ����������� ��������
SELECT FirstName, LastName FROM Visiters
WHERE EXISTS (SELECT * FROM VisitTable
	WHERE Visiters.id = VisitTable.id AND VisitTable.SectionId = 1);

-- ������� ���� ������������, ������� �� ��������� ��������, ������� � ��������
SELECT FirstName, LastName FROM Instructors
WHERE NOT EXISTS (SELECT * FROM Sections
	WHERE Instructors.SectionId = Sections.id 
	AND Sections.SectionName IN ('��������', '�������', '��������'));

-- 2. �� ������ ������� �� ANY/SOME (������ � �� ������ �������� ANY �� SOME)
-- ������� ���� �����������, ������� ������ � ���� � 2022 ����
SELECT FirstName, LastName FROM Visiters
WHERE id = ANY(SELECT id FROM VisitTable
	WHERE YEAR(FirstVisit) = 2022);

-- ����� ������������� ������ � 10:00?
SELECT FirstName, LastName FROM Instructors
WHERE SectionId = (SELECT id FROM Sections 
	WHERE id = SOME(SELECT SectionId FROM VisitTable		
		WHERE '10:00:00' BETWEEN StartPair AND EndPair));

-- 3. ���� ������ ALL
-- ������� ���� ����������� � ������ ����� ������ ������� �� ��������. ������ ����� �� �������� =(
SELECT FirstName, LastName FROM Visiters
WHERE Len(FirstName) < ALL (SELECT AVG(LEN(FirstName)) FROM Visiters); 

-- 4. ���� ������ �� ��������� ANY/SOME, ALL
-- ������� ���� ����������� � ������ ������� ������ �������, �� �� � ������ �������� ������� (�������, ��� ����=))
SELECT FirstName, LastName FROM Visiters, VisitTable
WHERE Visiters.VisitId = VisitTable.id AND Len(LastName) > ALL(SELECT AVG(LEN(LastName)) FROM Visiters)
	AND LEN(FirstName) < ANY(SELECT LEN(FirstName) FROM Visiters);

-- 5. ���� ������ �� UNION
-- ������� ���������� ����� ���� ������������ � �����������
SELECT FirstName FROM Visiters
UNION
SELECT FirstName FROM Instructors;

-- 6. ���� ������ �� UNION ALL
-- ������� id, ����� ���� ����������� � ����������� � �������� ��� ��� � ��������������� �� �����.
SELECT id, FirstName, 'Visiter' AS 'Who is this' FROM Visiters
UNION ALL
SELECT id, FirstName, 'Instructor' AS 'Who is this' FROM Instructors
ORDER BY FirstName;

-- 7. �� ������ ������� �� ��� JOIN(INNER/LEFT/RIGHT/LEFT+RIGHT/FULL) - ����� ���� ����-- INNER JOIN. ������ ���� �� ������������ ����������� ������� � ���������SELECT LastName + ' ' + FirstName AS FullName, Phone FROM InstructorsINNER JOIN Sections ON Instructors.SectionId = Sections.idWHERE SectionName IN ('�������', '���������')-- LEFT JOIN. ������� ���� ��������� � �� ��������� ����� ���� ���� ��� �� ������ ������SELECT FirstName, LastName, VisitTable.LastVisit FROM VisitersLEFT JOIN VisitTable ON Visiters.VisitId = VisitTable.id;-- RIGHT JOIN. ������� ������������ � ��� ������, ���� ���� � ��������� ������ ��� ������������SELECT LastName, FirstName, Sections.SectionName FROM InstructorsRiGHT JOIN Sections ON Instructors.SectionId = Sections.id-- FULL JOIN. ������� ������������ � ��� ������, ���� ���� � ����-�� ��� "����"SELECT LastName, FirstName, Sections.SectionName FROM InstructorsFULL JOIN Sections ON Instructors.SectionId = Sections.id