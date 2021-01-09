use LR6_8

SELECT TypeOfSandwich.Nazvanie AS [��� ��������], Sandwich.Cena as [����], Sandwich.Nazvanie_Sandwicha as [�������� ��������]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType
where Sandwich.Cena = (SELECT MAX(Sandwich.Cena) from Sandwich)

SELECT TypeOfSandwich.Nazvanie AS [��� ��������], Sandwich.Cena as [����], Sandwich.Nazvanie_Sandwicha as [�������� ��������]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType
where Sandwich.Cena > (SELECT avg(Sandwich.Cena) from Sandwich)

SELECT ZAKAZ.DataZak as [���� ������], ZAKAZ.Kolvo as [����������], ZAKAZ.Cena as [����], Office.Nazvanie3 as [��������], Office.Phone as [�������]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Kolvo = (SELECT min(ZAKAZ.Kolvo) from ZAKAZ)

SELECT Ing.Nazvanie AS [�������� ����������], Ing.Kolvo AS [���-�� ����������], TypeOfingred.Nazvanie2 AS [��� ����������]
FROM (SELECT * FROM Ingred) Ing
JOIN TypeOfingred ON Ing.IDT = TypeOfingred.IDT
WHERE Ing.Kolvo NOT BETWEEN 200 AND 500

SELECT ZAK.Kolvo as [����������], ZAK.Cena as [����], Office.Phone as [�������]
FROM (SELECT * FROM ZAKAZ) ZAK 
JOIN Office on ZAK.IDO  = Office.IDO
where ZAK.Kolvo > 200

SELECT ZAK.DataZak as [���� ������], ZAK.Cena as [����], Office.Nazvanie3 as [��������]
FROM (SELECT * FROM ZAKAZ) ZAK 
JOIN Office on ZAK.IDO  = Office.IDO

SELECT ZAKAZ.DataZak as [���� ������], (SELECT MIN(ZAKAZ.Cena) from ZAKAZ) as [����], Office.Nazvanie3 as [��������]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Cena > (SELECT MIN(ZAKAZ.Cena) from ZAKAZ)

SELECT TypeOfSandwich.Nazvanie AS [��� ��������], (SELECT avg(Sandwich.Cena) from Sandwich) as [����], Sandwich.Nazvanie_Sandwicha as [�������� ��������]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType

SELECT TypeOfSandwich.Nazvanie AS [��� ��������], (SELECT MAX(Sandwich.Cena) from Sandwich) as [����], Sandwich.Nazvanie_Sandwicha as [�������� ��������]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType