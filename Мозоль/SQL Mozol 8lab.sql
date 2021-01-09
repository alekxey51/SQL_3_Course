USE NewBD

SELECT nFIO as [ФИО наездника], nVes as [Вес наездника], nVozrast as[Возраст наездника], nRost as [Рост наездника] 
FROM Naeznik

SELECT nFIO as [ФИО наездника], nVes as [Вес наездника], nVozrast as[Возраст наездника], nRost as [Рост наездника] 
FROM Naeznik 
WHERE nVozrast > 22 AND nFIO <> 'Выставкин А.А'

SELECT DISTINCT nFIO as [ФИО наездника], nVes as [Вес наездника], nVozrast as[Возраст наездника]
FROM Naeznik 
WHERE nRost = 2

SELECT DISTINCT nFIO as [ФИО наездника], nVes as [Вес наездника], nVozrast as[Возраст наездника]
FROM Naeznik 
WHERE nRost = 1 OR nVes > 55

SELECT DISTINCT nFIO as [ФИО наездника], nVes as [Вес наездника]
FROM Naeznik 
WHERE nVes BETWEEN 55 AND 60
ORDER BY nFIO DESC

SELECT nFIO as [ФИО наездника], nVes as [Вес наездника]
FROM Naeznik 
WHERE nVes NOT BETWEEN 55 AND 60

SELECT nFIO as [ФИО наездника], nVozrast as[Возраст наездника]
FROM Naeznik
WHERE nFIO IN ('Мозоль А.В','Хоритонов В.В')

SELECT DISTINCT nFIO as [ФИО наездника], nVes as [Вес наездника], nVozrast as[Возраст наездника]
FROM Naeznik 
WHERE nFIO LIKE 'Б%'
UNION
SELECT DISTINCT nFIO as [ФИО наездника], nVes as [Вес наездника], nVozrast as[Возраст наездника]
FROM Naeznik 
WHERE nFIO LIKE 'м%'

SELECT DISTINCT nFIO as [ФИО наездника], nVes as [Вес наездника], nVozrast as[Возраст наездника]
FROM Naeznik 
ORDER BY nVes

