USE NewBD

SELECT LName AS [Кличка лошади], LMassa AS [Масса лошади], LSkor AS [Скорость лошади],  
Skachki.sName AS [Название скачек], sData AS [Дата скачек], zRezultat AS [Результат забега], DATEDIFF(day,sData, GETDATE()) AS [Скачки были дней назад]
FROM Skachki
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT LName AS [Кличка лошади], Skachki.sName AS [Название скачек], sData AS [Дата скачек], 
zRezultat AS [Результат забега], DATEDIFF(Month,sData, GETDATE()) AS [Скачки были мес назад]
FROM Skachki
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT pName AS Порода, sum(LMassa) AS [Масса всех лошадей]
FROM Loshad
JOIN Poroda on Loshad.IDPRD = Poroda.IDPRD
Group by pName

SELECT LName AS [Кличка лошади], exp(LSkor) AS [Экспонента скорости лошоди], lower(zRezultat) AS [Результат забега]
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT LName AS [Кличка лошади], power(LSkor,2) AS [Скорость лошади во 2-й степени], pName AS Порода, 
sqrt(zDlina) AS [Квадратный корень длины забега], zRezultat AS [Результат забега]
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
JOIN Poroda on Poroda.IDPRD = Loshad.IDPRD 

Select @@IDLE as 'миллисекунд с запуска SQL'
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT LName AS [Кличка лошади], sin(LMassa) AS [Масса лошади],  SUBSTRING(TipSkacheck.sName, 1, 6) AS [Тип скачек], 
Upper(Skachki.sName) AS [Название скачек], sData AS [Дата скачек], zRezultat AS [Результат забега]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT Skachki.sName AS [Название скачек], TipSkacheck.sName AS [Тип скачек], Year(sData) AS [Год скачек], DateName(Month, sData) as [Месяц скачек], 
zDlina AS [Длина забега]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH

SELECT charindex('м',LName,1) AS [Кличка лошади], sin(LMassa) AS [Масса лошади], sYear AS [Год состава], charindex('Второе', zRezultat) AS [Поиск 2-е место в результате]
FROM Zabeg 
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 

SELECT upper(nFIO) AS [ФИО наездника], square(nVes) AS [Вес наездника в квадрате], nVozrast AS [Возраст наездника], LName AS [Кличка лошади], LMassa AS [Масса лошади], sYear AS [Год состава]
FROM Loshad
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik

Select @@PACK_SENT AS 'Отправленные пакеты', @@TIMETICKS as 'микросекунд в одном такте процессора'
FROM Loshad
JOIN Poroda on Poroda.IDPRD = Loshad.IDPRD 
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik

SELECT ASCII(TipSkacheck.sName) AS [Тип скачек (код ASCII)], Skachki.sName AS [Название скачек], DateName(Month, sData) AS [Мнсяц скачек], zRezultat AS [Результат забега]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH


