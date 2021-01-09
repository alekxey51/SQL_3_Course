use LR6_8

SELECT ZAKAZ.DataZak AS [Дата заказа], ZAKAZ.Cena AS Цена, Sandwich.Nazvanie_Sandwicha AS [Название сендвича], power(Prigotovl.Kolvo,2) AS [Кол-во приготовления в 2-й степени]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT ZAKAZ.DataZak AS [Дата заказа], ZAKAZ.TimeZak AS [Время заказа], sin(ZAKAZ.Kolvo) AS [Синус кол-во], ZAKAZ.Cena AS Цена, 
Sandwich.Nazvanie_Sandwicha AS [Название сендвича], Sandwich.Cena AS [Цена Сендвича]
FROM Sandwich 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT ZAKAZ.DataZak AS [Дата заказа], sin(ZAKAZ.Cena) AS Цена, Sandwich.Nazvanie_Sandwicha AS [Название сендвича], sqrt(Sandwich.Cena) AS [Корень цены сендвича], Prigotovl.Kolvo AS [Количество приготовления]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT Replicate(Ingred.Nazvanie,4) AS [Название ингредиент], Ingred.Kolvo AS [Кол-во ингредиент], TypeOfingred.Nazvanie2 AS [Тип ингредиент], Prigotovl.Kolvo AS [Количество приготовления]
FROM Prigotovl
JOIN Ingred ON Prigotovl.IDI = Ingred.IDI 
JOIN TypeOfingred ON Ingred.IDT = TypeOfingred.IDT

SELECT Ingred.Nazvanie AS [Название ингредиент], Ingred.Kolvo AS [Кол-во ингредиент], Reverse(TypeOfingred.Nazvanie2) AS [Тип ингредиент]
FROM Ingred
JOIN TypeOfingred ON Ingred.IDT = TypeOfingred.IDT 

SELECT Upper(Sandwich.Nazvanie_Sandwicha) AS [Название сендвича], LOWER(TypeOfSandwich.Nazvanie) AS [Тип сендвича], Prigotovl.TimePrigo AS [Время приготовления]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType

Select @@IO_BUSY as [миллисекунд SQL Server ожидала выполнения]
FROM Prigotovl
JOIN Ingred ON Prigotovl.IDI = Ingred.IDI 
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 

Select @@TIMETICKS as [микросекунд в одном такте процессора], @@PACK_SENT AS [Отправленные пакеты]
FROM Sandwich 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

Select @@TIMETICKS as [микросекунд в одном такте процессора], @@PACKET_ERRORS AS [неправильных пакетов, принятых]
FROM Sandwich 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 
JOIN ZAKAZ ON Sandwich.IDSANDWICH = ZAKAZ.IDSANDWICH 

SELECT ASCII(Ingred.Nazvanie) AS [Название ингредиент], TypeOfingred.Nazvanie2 AS [Тип ингредиент], Prigotovl.TimePrigo AS [Время приготовления]
FROM Prigotovl
JOIN Ingred ON Prigotovl.IDI = Ingred.IDI 
JOIN TypeOfingred ON Ingred.IDT = TypeOfingred.IDT 

SELECT ASCII(Sandwich.Nazvanie_Sandwicha) AS [Название сендвича], ASCII(TypeOfSandwich.Nazvanie) AS [Тип сендвича], Prigotovl.TimePrigo AS [Время приготовления]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 

SELECT Right(Sandwich.Nazvanie_Sandwicha,5) AS [Название сендвича], Left(TypeOfSandwich.Nazvanie,3) AS [Тип сендвича], Prigotovl.Kolvo AS [Количество приготовления], Prigotovl.TimePrigo AS [Время приготовления]
FROM Prigotovl
JOIN Sandwich ON Prigotovl.IDSANDWICH = Sandwich.IDSANDWICH 
JOIN TypeOfSandwich ON Sandwich.IDType = TypeOfSandwich.IDType 