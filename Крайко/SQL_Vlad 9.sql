USE LAB4_5

SELECT Album.name AS [Название альбома], Album.year AS [Год альбома], Album.quantity AS число, Genre_Song.name AS [Жанр песни], Type_Song.name AS [Тип песни], Artist.firstname AS Фамилия, Artist.lastname AS Имя, Artist.patronymic AS Отчество, Record.year AS [Год записи], Country.name AS Страна, Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни], Type_album.name AS [Тип альбома], GENRE.name AS [название жанра], Artist_Group.name AS [Название группы], Artist_Group.quantity AS [число группы]
FROM Album 
JOIN Artist ON Album.IDa = Artist.IDa 
JOIN Artist_and_Group ON Artist.IDa = Artist_and_Group.IDa 
JOIN Artist_Group ON Artist_and_Group.IDg = Artist_Group.IDg 
JOIN Country ON Artist.IDc = Country.IDc 
JOIN GENRE ON Artist.IDge = GENRE.IDge 
JOIN Record ON Album.IDa = Record.IDa 
JOIN Song ON Artist.IDa = Song.IDa AND Record.IDs = Song.IDs 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_album ON Album.IDta = Type_album.IDta 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
ORDER BY Album.name

SELECT Type_Song.name AS [Тип песни], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Song 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
WHERE Song.number_song > 5 AND Song.name <> 'Любимка'
ORDER BY Type_Song.name DESC

SELECT Artist.firstname AS Фамилия, Artist.lastname AS Имя, Artist.patronymic AS Отчество, GENRE.name AS [название жанра]
FROM Artist
JOIN GENRE ON Artist.IDge = GENRE.IDge 
WHERE Artist.firstname LIKE 'Х%'

SELECT Type_Song.name AS [Тип песни], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Song 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
WHERE Song.number_song NOT BETWEEN 5 AND 7
ORDER BY Type_Song.name

SELECT Type_Song.name AS [Тип песни], Song.name AS [название песни], Song.number_song AS [номер песни], Song.time_song AS [Время песни]
FROM Song 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
WHERE Song.number_song BETWEEN 5 AND 7