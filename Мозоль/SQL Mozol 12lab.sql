USE NewBD

SELECT LName AS [Кличка лошади], LMassa AS [Масса лошади], LSkor AS [Скорость лошади], LDlina AS [Длина лошади], LRost AS [Рост лошади], pName AS Порода
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where LMassa = (SELECT MAX(LMassa) from Loshad)

SELECT LName AS [Кличка лошади], LMassa AS [Масса лошади], LSkor AS [Скорость лошади], pName AS Порода
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where LMassa > (SELECT avg(LMassa) from Loshad)

SELECT LName AS [Кличка лошади], LSkor AS [Скорость лошади], pName AS Порода
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where LSkor = (SELECT min(LSkor) from Loshad)

-------------------

SELECT LName AS [Кличка лошади], (SELECT min(LSkor) from Loshad) AS [Скорость лошади], pName AS Порода
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where pName <> 'Мустанг'

SELECT nFIO AS [ФИО наездника], (SELECT avg(nVes) from Naeznik) AS [Вес наездника], nVozrast AS [Возраст наездника], sYear AS [Год состава]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
WHERE sYear NOT BETWEEN 2017 AND 2018

SELECT nFIO AS [ФИО наездника], (SELECT MIN(nVozrast) from Naeznik) AS [Возраст наездника], sYear AS [Год состава]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
WHERE sYear BETWEEN 2017 AND 2018

-----------------------

SELECT Naeznik.nFIO AS [ФИО наездника], Naeznik.nVes AS [Вес наездника], Naeznik.nVozrast AS [Возраст наездника], sYear AS [Год состава]
FROM (SELECT * FROM Sostav) Sostav2 
JOIN Naeznik on Sostav2.IDNaeznik = Naeznik.IDNaeznik
ORDER BY nFIO

SELECT Skachki.sName AS [Название скачек], Tip.sName AS [Тип скачек], Skachki.sData AS [Дата скачек]
FROM (SELECT * FROM TipSkacheck) Tip
JOIN Skachki on Tip.IDTS = Skachki.IDTS

SELECT Losh.LName AS [Кличка лошади], Losh.LMassa AS [Масса лошади], Losh.LSkor AS [Скорость лошади], Poroda.pName AS Порода
FROM (SELECT * FROM Loshad) Losh
JOIN Poroda on Losh.IDPRD = Poroda.IDPRD
WHERE Losh.LMassa > 500 AND Poroda.pName <> 'Аппалуза'
ORDER BY Losh.LName DESC