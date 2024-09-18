-- 5 запросов по БД Овощи-Фрукты

-- 1 Выведите все овощи красного цвета
SELECT Name, Color FROM VegetablesFruits AS VF, Types, Colors
WHERE VF.idTypes = Types.id AND VF.idColors = Colors.id 
	AND Colors.Color = 'Красный' AND Types.Type = 'Овощ';

-- 2 Отсортируйте все фрукты по возрастанию калорийности
SELECT Name, [Caloric content] FROM VegetablesFruits AS VF, Types
WHERE VF.idTypes = Types.id AND Types.Type = 'Фрукт'
ORDER BY [Caloric content] ASC

-- 3 Выведите все зеленые овощи/фрукты и их описание
SELECT Name, Description FROM VegetablesFruits AS VF, Colors
WHERE VF.idColors = Colors.id AND Colors.Color = 'Зеленый'

-- 4 Выведите зеленые овощи и красные фрукты
SELECT Name, Type, Color FROM VegetablesFruits AS VF, Types, Colors
WHERE VF.idTypes = Types.id AND VF.idColors = Colors.id 
	AND ((Color = 'Зеленый' AND Type = 'Овощ') OR (Color = 'Красный' AND Type = 'Фрукт'))

-- 5 Выведите всю информацию о груши
SELECT VF.id, Name, Type, Color, [Caloric content], Description
FROM  VegetablesFruits AS VF, Types, Colors
WHERE VF.idTypes = Types.id AND VF.idColors = Colors.id AND Name = 'Груша'