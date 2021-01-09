USE NewBD

SELECT nFIO AS [ФИО наездника], nVes AS [Вес наездника], nVozrast AS [Возраст наездника], nRost AS [Рост наездника], LName AS [Кличка лошади], LMassa AS [Масса лошади], LSkor AS [Скорость лошади], LDlina AS [Длина лошади], LRost AS [Рост лошади], pName AS Порода, TipSkacheck.sName AS [Тип скачек], sYear AS [Год состава], Skachki.sName AS [Название скачек], sData AS [Дата скачек], zDlina AS [Длина забега], zRezultat AS [Результат забега]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
JOIN Poroda on Poroda.IDPRD = Loshad.IDPRD 
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
ORDER BY nFIO

SELECT nFIO AS [ФИО наездника], nVozrast AS [Возраст наездника], LName AS [Кличка лошади], LSkor AS [Скорость лошади], sYear AS [Год состава]
FROM Sostav
JOIN Loshad on Sostav.IDLoshad = Loshad.IDLoshad
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
WHERE LName LIKE 'В%' 

SELECT LName AS [Кличка лошади], LMassa AS [Масса лошади], LSkor AS [Скорость лошади], zDlina AS [Длина забега], Skachki.sName AS [Название скачек], sData AS [Дата скачек], zRezultat AS [Результат забега]
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad
JOIN Skachki on Zabeg.IDLoshad = Skachki.IDSKCH
WHERE zDlina = 3

SELECT Skachki.sName AS [Название скачек], TipSkacheck.sName AS [Тип скачек], sData AS [Дата скачек]
FROM TipSkacheck
JOIN Skachki on TipSkacheck.IDTS = Skachki.IDTS
WHERE sData NOT BETWEEN '2020-01-17' AND '2020-02-21'
ORDER BY sData

SELECT LName AS [Кличка лошади], LMassa AS [Масса лошади], LSkor AS [Скорость лошади], LDlina AS [Длина лошади], LRost AS [Рост лошади], pName AS Порода
FROM Loshad 
JOIN Poroda on Loshad.IDPRD = Poroda.IDPRD
WHERE LMassa > 500 AND pName <> 'Аппалуза'
ORDER BY LName DESC


