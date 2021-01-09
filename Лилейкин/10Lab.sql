use LR6_8

SELECT TypeOfingred.Nazvanie2 AS [Тип ингредиента], count(*) as 'Кол-во'
FROM Ingred 
JOIN TypeOfingred on Ingred.IDT = TypeOfingred.IDT
Group BY TypeOfingred.Nazvanie2 
HAVING COUNT(*) = 1

SELECT TypeOfSandwich.Nazvanie AS [Тип сендвича], count(*) as 'Кол-во'
FROM Sandwich
JOIN TypeOfSandwich on Sandwich.IDType = TypeOfSandwich.IDType
Group BY TypeOfSandwich.Nazvanie

SELECT GOROD.Nazvanie AS [Название города], count(*) as 'Кол-во'
FROM Office
JOIN GOROD on Office.IDG = GOROD.IDG 
Group BY GOROD.Nazvanie

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

SELECT ZAKAZ.Kolvo as [Количество], ZAKAZ.Cena as [Цена], Office.Phone as [Телефон]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Cena < (SELECT avg(ZAKAZ.Cena) from ZAKAZ)

SELECT ZAKAZ.DataZak as [Дата заказа], ZAKAZ.Cena as [Цена], Office.Nazvanie3 as [Название]
FROM ZAKAZ 
JOIN Office on ZAKAZ.IDO  = Office.IDO
where ZAKAZ.Cena > (SELECT MIN(ZAKAZ.Cena) from ZAKAZ)