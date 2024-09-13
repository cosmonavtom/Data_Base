-- ����������� ���� ���������� �� ������� �� ���������� � ��������
SELECT * FROM StudentsInfo;

-- ����������� ��� ���� ���������
SELECT FirstName + ' ' + LastName AS FullName
FROM StudentsInfo;

-- ����������� ���� ������� ������
SELECT [AVG Mark] FROM StudentsInfo;

-- �������� ��� ���� ��������� � ����������� �������, ������, ��� ��������� (����� ����� 3,5)
SELECT FirstName + ' ' + LastName AS FullName
FROM StudentsInfo
WHERE [Min avg mark] > 3.5;

-- �������� ������ ���������. �������� ����� ������ ���� �����������
SELECT DISTINCT Country FROM StudentsInfo;

-- �������� ������ ���������. �������� ������� ������ ���� �����������
SELECT DISTINCT City FROM StudentsInfo;

-- �������� �������� �����. �������� ����� ������ ���� �����������
SELECT DISTINCT [Group] FROM StudentsInfo;