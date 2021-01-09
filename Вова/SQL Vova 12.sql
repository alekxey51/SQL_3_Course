use Vova_5

SELECT ФИО, Пол, (SELECT avg(Возраст) from Ученик), Город.Название as [Название города]
FROM Ученик
JOIN Город on Ученик.IDгород = Город.IDгород
WHERE Пол = 'м'

SELECT ФИО, Пол, (SELECT min(Возраст) from Ученик), ДатаРождения, Город.Название as [Название города]
FROM Ученик
JOIN Город on Ученик.IDгород = Город.IDгород
WHERE Город.Название  <> 'Брест'

SELECT ФИО, Пол, (SELECT max(Возраст) from Ученик), Город.Название as [Название города]
FROM Ученик
JOIN Город on Ученик.IDгород = Город.IDгород

SELECT Ychenic.ФИО, Ychenic.Пол, Ychenic.Возраст, Ychenic.ДатаРождения, Город.Название as [Название города]
FROM (SELECT * FROM Ученик) Ychenic
JOIN Город on Ychenic.IDгород = Город.IDгород
WHERE Ychenic.Пол = 'Ж'
ORDER BY Ychenic.Возраст DESC

SELECT Predmet.Название as [Название предмета], КоличествоЧас, ТипПредмета.Название as [Тип предмета]
FROM (SELECT * FROM Предмет) Predmet
JOIN ТипПредмета on Predmet.IDтп = ТипПредмета.IDтп
WHERE ТипПредмета.Название <> 'Точная наука' and Predmet.Название LIKE 'Л%' 
ORDER BY КоличествоЧас

SELECT ФИО,  Предмет.Название as [Название предмета], Vbor.ОтметкаОВыборе
FROM (SELECT * FROM Выбор) Vbor
JOIN Предмет on Vbor.IDпредмет = Предмет.IDпредмет
JOIN Ученик on Vbor.IDпаспорт = Ученик.IDпаспорт
WHERE Vbor.ОтметкаОВыборе > 4 and Предмет.Название <> 'Физкультура'

SELECT ФИО, Пол, Возраст, ДатаРождения, Город.Название as [Название города]
FROM Ученик
JOIN Город on Ученик.IDгород = Город.IDгород
where Возраст = (SELECT min(Возраст) from Ученик)

SELECT ФИО, Пол, Возраст, Город.Название as [Название города]
FROM Ученик
JOIN Город on Ученик.IDгород = Город.IDгород
where Возраст = (SELECT max(Возраст) from Ученик)

SELECT Предмет.Название as [Название предмета], КоличествоЧас, ТипПредмета.Название as [Тип предмета]
FROM Предмет
JOIN ТипПредмета on Предмет.IDтп = ТипПредмета.IDтп 
where КоличествоЧас > (SELECT avg(КоличествоЧас) from Предмет)