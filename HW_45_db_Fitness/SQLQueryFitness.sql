-- ������� ���������� ������������ �� ������ ������
SELECT SectionName, COUNT(*) AS Instructors FROM Sections, Instructors
WHERE Sections.id = Instructors.SectionId
GROUP BY SectionName;

-- �������� ���������� �����, ������� ������ ���������� � ������������ ������ ������� � ������ ������
/* ��� ����� ��������, ��� �� �����. ���� ���� ����� �������� ������. � ��������� ������, � ����� �
���-�� ����� ������� ��� �������� */
SELECT SectionName, StartPair, EndPair, COUNT(*) AS Visiters
FROM Sections, VisitTable
WHERE Sections.id = VisitTable.SectionId
GROUP BY SectionName, StartPair, EndPair;

-- ������� ���������� ����������� ������ �����, ������� ���������� �������� ������������� ���������� ���������
/* ����� ������� �����, ������� ���������� �������� ���������� ������������ �� +333 */
SELECT COUNT(*) AS Operator_333 FROM Visiters
WHERE Phone LIKE '+333%';

-- �������� ���������� �����������, � ������� ������� ��������� � ��������� �� ������������� ������
/* ����� ������� ����� � ��������� - �����, ������, ������ � ���������� */
SELECT COUNT(*) AS SomeLastName FROM Visiters
WHERE LastName IN ('�����', '������', '������', '����������');

-- �������� ���������� ����� � ����������� �������, ������� ���������� � ������������� �����������
/* ����� ������� � ����������� �� ��������� ����� �������*/
SELECT V.FirstName, COUNT(*) AS DistinctNames
FROM Visiters AS V, Instructors AS I, VisitTable AS VT, Sections AS S
WHERE V.VisitId = VT.id AND VT.SectionId = S.id AND I.SectionId = S.id 
	AND I.LastName = '������' AND I.FirstName = 'ϸ��'
GROUP BY V.FirstName;

-- �������� ���������� � �����, ������� �������� ������ ��� ����������� ���������� ���
/* ��������� ������ ���������� �� �������, ������� ����� �������� �������, ���, ������� 
� ���-�� ���������� ���� 5-� "�������������" */
SELECT TOP 5 FirstName, LastName, Phone, DATEDIFF(day, FirstVisit, LastVisit) AS Day_of_visits
FROM Visiters, VisitTable
WHERE Visiters.VisitId = VisitTable.id
ORDER BY Day_of_visits; 

-- ������� ���������� �����������, ������� ���������� � ������������ ������ �� ������ �������� �������� ����
/* ���� ������ ���� �� ���� ��������� � ������ �������� ���� � ������ ��������, �� �� ��� ������� */
SELECT COUNT(*) AS First_Half_Year
FROM Sections, VisitTable
WHERE VisitTable.SectionId = Sections.id AND SectionName = '��������'
	AND FirstVisit < '2024-07-01' AND LastVisit >= '2024-01-01';

-- ���������� ����� ���������� �����, ���������� ������ ��� �� ������� ���
/* ���, ��������� ������. ���� �������*/
SELECT COUNT(*) AS Number_of_visiters_from_2023
FROM VisitTable
WHERE 2023 BETWEEN YEAR(FirstVisit) AND YEAR(LastVisit);

