USE NewBD

SELECT nFIO as [��� ���������], nVes as [��� ���������], nVozrast as[������� ���������], nRost as [���� ���������] 
FROM Naeznik

SELECT nFIO as [��� ���������], nVes as [��� ���������], nVozrast as[������� ���������], nRost as [���� ���������] 
FROM Naeznik 
WHERE nVozrast > 22 AND nFIO <> '��������� �.�'

SELECT DISTINCT nFIO as [��� ���������], nVes as [��� ���������], nVozrast as[������� ���������]
FROM Naeznik 
WHERE nRost = 2

SELECT DISTINCT nFIO as [��� ���������], nVes as [��� ���������], nVozrast as[������� ���������]
FROM Naeznik 
WHERE nRost = 1 OR nVes > 55

SELECT DISTINCT nFIO as [��� ���������], nVes as [��� ���������]
FROM Naeznik 
WHERE nVes BETWEEN 55 AND 60
ORDER BY nFIO DESC

SELECT nFIO as [��� ���������], nVes as [��� ���������]
FROM Naeznik 
WHERE nVes NOT BETWEEN 55 AND 60

SELECT nFIO as [��� ���������], nVozrast as[������� ���������]
FROM Naeznik
WHERE nFIO IN ('������ �.�','��������� �.�')

SELECT DISTINCT nFIO as [��� ���������], nVes as [��� ���������], nVozrast as[������� ���������]
FROM Naeznik 
WHERE nFIO LIKE '�%'
UNION
SELECT DISTINCT nFIO as [��� ���������], nVes as [��� ���������], nVozrast as[������� ���������]
FROM Naeznik 
WHERE nFIO LIKE '�%'

SELECT DISTINCT nFIO as [��� ���������], nVes as [��� ���������], nVozrast as[������� ���������]
FROM Naeznik 
ORDER BY nVes

