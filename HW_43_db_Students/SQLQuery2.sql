-- �������� ��� ���� ��������� � ����������� ������� � ��������� ���������(����� ����� �� 2 �� 3 ������������)
SELECT FirstName + ' ' + LastName AS FullName
FROM StudentsInfo
WHERE [Min avg mark] >= 2 AND [Min avg mark] <= 3;

-- �������� ���������� � ���������, ������� ����������� 20 ���
SELECT * FROM StudentsInfo
WHERE BirthDate < '2004-09-10';

-- �������� ���������� � ��������� � ��������� � ��������� ��������� (����� ����� �� 20 �� 30)
SELECT * FROM StudentsInfo
WHERE BirthDate BETWEEN '1994-09-10' AND '2004-09-10';

-- �������� ���������� � ��������� � ���������� ������. ��������, �������� ��������� � ������ �����
SELECT * FROM StudentsInfo
WHERE FirstName = 'Boris';

-- �������� ���������� � ���������, � ���� ������ ����������� ��� �������
SELECT * FROM StudentsInfo
WHERE Phone LIKE '%7%7%7%';

-- �������� ����������� ������ ���������, ������������ � ���������� ����� (����� ����� 'a')
SELECT [E-mail] FROM StudentsInfo
WHERE [E-mail] LIKE 'a%';
