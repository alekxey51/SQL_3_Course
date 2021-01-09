use LR6_8

SELECT TypeOfSandwich.Nazvanie AS [Тип сендвича], Sandwich.Cena as [Цена], Sandwich.Nazvanie_Sandwicha as [Название сендвича]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType
where Sandwich.Cena = (SELECT MAX(Sandwich.Cena) from Sandwich)

SELECT TypeOfSandwich.Nazvanie AS [Тип сендвича], Sandwich.Cena as [Цена], Sandwich.Nazvanie_Sandwicha as [Название сендвича]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType
where Sandwich.Cena > (SELECT avg(Sandwich.Cena) from Sandwich)

SELECT ZAKAZ.DataZak as [Дата заказа], ZAKAZ.Kolvo as [Количество], ZAKAZ.Cena as [Цена], Office.Nazvanie3 as [Название], Office.Phone as [Телефон]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Kolvo = (SELECT min(ZAKAZ.Kolvo) from ZAKAZ)

SELECT Ing.Nazvanie AS [Название ингредиент], Ing.Kolvo AS [Кол-во ингредиент], TypeOfingred.Nazvanie2 AS [Тип ингредиент]
FROM (SELECT * FROM Ingred) Ing
JOIN TypeOfingred ON Ing.IDT = TypeOfingred.IDT
WHERE Ing.Kolvo NOT BETWEEN 200 AND 500

SELECT ZAK.Kolvo as [Количество], ZAK.Cena as [Цена], Office.Phone as [Телефон]
FROM (SELECT * FROM ZAKAZ) ZAK 
JOIN Office on ZAK.IDO  = Office.IDO
where ZAK.Kolvo > 200

SELECT ZAK.DataZak as [Дата заказа], ZAK.Cena as [Цена], Office.Nazvanie3 as [Название]
FROM (SELECT * FROM ZAKAZ) ZAK 
JOIN Office on ZAK.IDO  = Office.IDO

SELECT ZAKAZ.DataZak as [Дата заказа], (SELECT MIN(ZAKAZ.Cena) from ZAKAZ) as [Цена], Office.Nazvanie3 as [Название]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Cena > (SELECT MIN(ZAKAZ.Cena) from ZAKAZ)

SELECT TypeOfSandwich.Nazvanie AS [Тип сендвича], (SELECT avg(Sandwich.Cena) from Sandwich) as [Цена], Sandwich.Nazvanie_Sandwicha as [Название сендвича]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType

SELECT TypeOfSandwich.Nazvanie AS [Тип сендвича], (SELECT MAX(Sandwich.Cena) from Sandwich) as [Цена], Sandwich.Nazvanie_Sandwicha as [Название сендвича]
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType