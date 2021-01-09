USE LAB4_5

SELECT Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.time_song = (SELECT min(Song.time_song) from Song)

SELECT Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song = (SELECT max(Song.number_song) from Song)

SELECT Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song > (SELECT avg(Song.number_song) from Song)

SELECT Genre_Song.name AS [Жанр песни], Type_Song.name AS [Тип песни], Сонг.name AS [название песни], Сонг.number_song AS [номера песни]
FROM (SELECT * FROM Song) Сонг
JOIN Genre_Song ON Сонг.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Сонг.IDts = Type_Song.IDts
ORDER BY Genre_Song.name

SELECT Альбом.name AS [Название альбома], Альбом.quantity AS [число], Record.year AS [Год записи]
FROM (SELECT * FROM Album) Альбом
JOIN Record ON Альбом.IDa = Record.IDa 
ORDER BY Альбом.name

SELECT Артист.firstname AS Фамилия, Артист.lastname AS Имя, Артист.patronymic AS Отчество, GENRE.name AS [название жанра]
FROM (SELECT * FROM Artist) Артист
JOIN GENRE ON Артист.IDge = GENRE.IDge 
WHERE Артист.firstname LIKE 'Х%'

SELECT Genre_Song.name AS [Жанр песни], Type_Song.name AS [Тип песни], Song.name AS [название песни], (SELECT min(number_song) from Song) AS [номер песни]
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts

SELECT Artist.lastname AS Имя, Country.name AS Страна, Song.name AS [название песни], (SELECT max(number_song) from Song) AS [номер песни]
FROM Artist 
JOIN Country ON Artist.IDc = Country.IDc
JOIN Song ON Artist.IDa = Song.IDa 

SELECT Genre_Song.name AS [Жанр песни], Record.year AS [Год записи], Song.name AS [название песни], (SELECT avg(number_song) from Song) AS [номер песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 