-- Приведение БД Students к 3ей нормальной форме

-- Делаю копию основной таблицы VegetablesFruits
SELECT * INTO BackupVeg From VegetablesFruits;


-- Выносим тип (овощ|фрукт) в отдельную таблицу
SELECT Type 
INTO Types
FROM VegetablesFruits
GROUP BY Type;

-- Выносим цвет в отдельную таблицу
SELECT Color 
INTO Colors
FROM VegetablesFruits
GROUP BY Color;

-- Удаляю ненужные поля в основной таблице
ALTER TABLE VegetablesFruits
DROP COLUMN Type, Color;


