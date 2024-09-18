-- 5 �������� �� �� �����-������

-- 1 �������� ��� ����� �������� �����
SELECT Name, Color FROM VegetablesFruits AS VF, Types, Colors
WHERE VF.idTypes = Types.id AND VF.idColors = Colors.id 
	AND Colors.Color = '�������' AND Types.Type = '����';

-- 2 ������������ ��� ������ �� ����������� ������������
SELECT Name, [Caloric content] FROM VegetablesFruits AS VF, Types
WHERE VF.idTypes = Types.id AND Types.Type = '�����'
ORDER BY [Caloric content] ASC

-- 3 �������� ��� ������� �����/������ � �� ��������
SELECT Name, Description FROM VegetablesFruits AS VF, Colors
WHERE VF.idColors = Colors.id AND Colors.Color = '�������'

-- 4 �������� ������� ����� � ������� ������
SELECT Name, Type, Color FROM VegetablesFruits AS VF, Types, Colors
WHERE VF.idTypes = Types.id AND VF.idColors = Colors.id 
	AND ((Color = '�������' AND Type = '����') OR (Color = '�������' AND Type = '�����'))

-- 5 �������� ��� ���������� � �����
SELECT VF.id, Name, Type, Color, [Caloric content], Description
FROM  VegetablesFruits AS VF, Types, Colors
WHERE VF.idTypes = Types.id AND VF.idColors = Colors.id AND Name = '�����'