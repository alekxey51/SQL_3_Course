USE LAB4_5

SELECT Type_album.name AS [Тип альбома], COUNT(*) as 'Кол-во одинаковых альбомов'
FROM Album 
JOIN Type_album ON Album.IDta = Type_album.IDta 
Group BY Type_album.name

SELECT Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song = (SELECT min(Song.number_song) from Song)

SELECT Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song = (SELECT max(Song.number_song) from Song)

SELECT Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song > (SELECT avg(Song.number_song) from Song)

SELECT Country.name AS Страна, COUNT(*) as 'Кол-во артистов в странах'
FROM Artist
JOIN Country ON Artist.IDc = Country.IDc 
Group BY Country.name
HAVING Country.name <> 'Албания'

SELECT Genre_Song.name AS [Жанр песни], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Song
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
where Song.time_song < (SELECT max(Song.time_song) from Song)

SELECT GENRE.name AS [название жанра], COUNT(*) as 'Кол-во артистов с одинаковым жанром'
FROM Artist
JOIN GENRE ON Artist.IDge = GENRE.IDge 

SELECT Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Record.year = (SELECT max(Record.year) from Record)