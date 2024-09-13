-- �������� ����������� ������� ������ �� ���� ��������� (�� ������ �����, ������ ����� ������ ��� � �������)
SELECT FirstName + ' ' + LastName As FullName, [Min avg mark]
FROM StudentsInfo

-- �������� ������������ ������� ������ �� ���� ���������
SELECT FirstName + ' ' + LastName As FullName, [Max avg mark]
FROM StudentsInfo

-- �������� ���������� ������� ���������. ����� ���������� �������� ������ � ���������� ���������
-- �� ����� ������
SELECT DISTINCT City, COUNT(City) AS [Students]
FROM StudentsInfo
GROUP BY City

-- �������� ���������� ����� ���������. ����� ���������� �������� ������ � ����������
-- ��������� �� ���� ������
SELECT DISTINCT Country, COUNT(Country) AS [Students]
FROM StudentsInfo
GROUP BY Country

-- ������ ������� �� ����������� ��������(�٨ �� ���������!=))). �������� ��� ������ ������ �� � ��� ������