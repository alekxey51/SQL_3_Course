use LR6_8

SELECT ZAKAZ.DataZak AS [���� ������], ZAKAZ.Cena AS ����, Sandwich.Nazvanie_Sandwicha AS [�������� ��������], power(Prigotovl.Kolvo,2) AS [���-�� ������������� � 2-� �������]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT ZAKAZ.DataZak AS [���� ������], ZAKAZ.TimeZak AS [����� ������], sin(ZAKAZ.Kolvo) AS [����� ���-��], ZAKAZ.Cena AS ����, 
Sandwich.Nazvanie_Sandwicha AS [�������� ��������], Sandwich.Cena AS [���� ��������]
FROM Sandwich 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT ZAKAZ.DataZak AS [���� ������], sin(ZAKAZ.Cena) AS ����, Sandwich.Nazvanie_Sandwicha AS [�������� ��������], sqrt(Sandwich.Cena) AS [������ ���� ��������], Prigotovl.Kolvo AS [���������� �������������]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT Replicate(Ingred.Nazvanie,4) AS [�������� ����������], Ingred.Kolvo AS [���-�� ����������], TypeOfingred.Nazvanie2 AS [��� ����������], Prigotovl.Kolvo AS [���������� �������������]
FROM Prigotovl
JOIN Ingred ON Prigotovl.IDI = Ingred.IDI 
JOIN TypeOfingred ON Ingred.IDT = TypeOfingred.IDT

SELECT Ingred.Nazvanie AS [�������� ����������], Ingred.Kolvo AS [���-�� ����������], Reverse(TypeOfingred.Nazvanie2) AS [��� ����������]
FROM Ingred
JOIN TypeOfingred ON Ingred.IDT = TypeOfingred.IDT 

SELECT Upper(Sandwich.Nazvanie_Sandwicha) AS [�������� ��������], LOWER(TypeOfSandwich.Nazvanie) AS [��� ��������], Prigotovl.TimePrigo AS [����� �������������]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType

Select @@IO_BUSY as [����������� SQL Server ������� ����������]
FROM Prigotovl
JOIN Ingred ON Prigotovl.IDI = Ingred.IDI 
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 

Select @@TIMETICKS as [����������� � ����� ����� ����������], @@PACK_SENT AS [������������ ������]
FROM Sandwich 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

Select @@TIMETICKS as [����������� � ����� ����� ����������], @@PACKET_ERRORS AS [������������ �������, ��������]
FROM Sandwich 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT ASCII(Ingred.Nazvanie) AS [�������� ����������], TypeOfingred.Nazvanie2 AS [��� ����������], Prigotovl.TimePrigo AS [����� �������������]
FROM Prigotovl
JOIN Ingred ON Prigotovl.IDI = Ingred.IDI 
JOIN TypeOfingred ON Ingred.IDT = TypeOfingred.IDT 

SELECT ASCII(Sandwich.Nazvanie_Sandwicha) AS [�������� ��������], ASCII(TypeOfSandwich.Nazvanie) AS [��� ��������], Prigotovl.TimePrigo AS [����� �������������]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 

SELECT Right(Sandwich.Nazvanie_Sandwicha,5) AS [�������� ��������], Left(TypeOfSandwich.Nazvanie,3) AS [��� ��������], Prigotovl.Kolvo AS [���������� �������������], Prigotovl.TimePrigo AS [����� �������������]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 