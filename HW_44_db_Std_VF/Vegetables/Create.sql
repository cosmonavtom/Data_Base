-- ���������� �� Students � 3�� ���������� �����

-- ����� ����� �������� ������� VegetablesFruits
SELECT * INTO BackupVeg From VegetablesFruits;


-- ������� ��� (����|�����) � ��������� �������
SELECT Type 
INTO Types
FROM VegetablesFruits
GROUP BY Type;

-- ������� ���� � ��������� �������
SELECT Color 
INTO Colors
FROM VegetablesFruits
GROUP BY Color;

-- ������ �������� ���� � �������� �������
ALTER TABLE VegetablesFruits
DROP COLUMN Type, Color;


