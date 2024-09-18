-- ���������� �� Students � 3�� ���������� �����

-- ����� ����� �������� ������� StudentsInfo, ��� �� �� ���� ��� � ������� ���...
SELECT * INTO BackupStudents From StudentsInfo;

/* ������ ������� City � Country � ��������� ������� StudentsFrom � ��������� �� Country,
��� � ���� ������� ������ ����� �� ����, �� ������������ ��������. �� � ��� �� ��������������
�������� ������������ */
SELECT Country, COUNT(Country) AS CountContry, City
INTO StudentsFrom 
FROM StudentsInfo
GROUP BY Country, City;

-- ������ ���������� ������ ��������� � ������� StudentContacts
SELECT [E-mail], Phone 
INTO StudentContacts
FROM StudentsInfo;

-- ������ ������� � �������� ��� ���������. ���������� �� ������ =)
SELECT [Group], COUNT([Group]) AS QuantityStudents
INTO StudentGroups
FROM StudentsInfo
GROUP BY [Group];

-- �� � ������� � ��������� ������� ������ ���������
SELECT [Min avg mark], [Max avg mark], [Avg mark]
INTO StudentMarks
FROM StudentsInfo;

-- ����� ��������. ������ �������� ���� � �������� �������
ALTER TABLE StudentsInfo
DROP COLUMN City, Country, BirthDate, [E-mail], Phone, [Group],
	[Min avg mark], [Max avg mark], [Avg mark];


