use LR6_8

SELECT TypeOfingred.Nazvanie2 AS [��� �����������], count(*) as '���-��'
FROM Ingred 
JOIN TypeOfingred on Ingred.IDT = TypeOfingred.IDT
Group BY TypeOfingred.Nazvanie2 
HAVING COUNT(*) = 1

SELECT TypeOfSandwich.Nazvanie AS [��� ��������], count(*) as '���-��'
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType
Group BY TypeOfSandwich.Nazvanie

SELECT GOROD.Nazvanie AS [�������� ������], count(*) as '���-��'
FROM Office
JOIN GOROD on Office.IDG = GOROD.IDG 
Group BY GOROD.Nazvanie

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

SELECT ZAKAZ.Kolvo as [����������], ZAKAZ.Cena as [����], Office.Phone as [�������]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Cena < (SELECT avg(ZAKAZ.Cena) from ZAKAZ)

SELECT ZAKAZ.DataZak as [���� ������], ZAKAZ.Cena as [����], Office.Nazvanie3 as [��������]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Cena > (SELECT MIN(ZAKAZ.Cena) from ZAKAZ)