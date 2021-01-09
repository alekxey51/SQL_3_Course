USE NewBD

SELECT TipSkacheck.sName, count(*) as 'Кол-во проведенных скачек'
FROM Skachki JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS
Group BY TipSkacheck.sName 
HAVING COUNT(*) >= 2

SELECT sData AS [Дата скачек], count(*) as 'Кол-во скачек в определенную дату'
FROM Zabeg
JOIN Skachki on Zabeg.IDSKCH = Skachki.IDSKCH
Group BY sData
HAVING sData <> '2020-01-17'

SELECT zRezultat AS [Результат забега], count(*) as 'Кол-во занятых мест'
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
Group BY zRezultat

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

SELECT nFIO AS [ФИО наездника], nVes AS [Вес наездника], nVozrast AS [Возраст наездника], sYear AS [Год состава]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
where nVes < (SELECT avg(nVes) from Naeznik)

SELECT nFIO AS [ФИО наездника], nVozrast AS [Возраст наездника], sYear AS [Год состава]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
where nVozrast > (SELECT MIN(nVozrast) from Naeznik)