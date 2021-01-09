USE LAB4_5

------------------------------

SELECT Genre_Song.name AS [Жанр песни], Type_Song.name AS [Тип песни], Song.name AS [название песни], sin(Song.number_song) AS [Синус номера песни]
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
ORDER BY Genre_Song.name

SELECT Album.name AS [Название альбома], sqrt(Album.quantity) AS [Корень число], Record.year AS [Год записи]
FROM Album 
JOIN Record ON Album.IDa = Record.IDa 
ORDER BY Album.name

SELECT Artist.lastname AS Имя, GENRE.name AS [название жанра], power(Artist_Group.quantity,2) AS [число группы в 2-й степени]
FROM Artist
JOIN Artist_and_Group ON Artist.IDa = Artist_and_Group.IDa 
JOIN Artist_Group ON Artist_and_Group.IDg = Artist_Group.IDg 
JOIN GENRE ON Artist.IDge = GENRE.IDge 

SELECT ASCII(Album.name) AS [Название альбома], Album.year AS [Год альбома], Album.quantity AS число, Record.year AS [Год записи], Type_album.name AS [Тип альбома]
FROM Album 
JOIN Record ON Album.IDa = Record.IDa 
JOIN Type_album ON Album.IDta = Type_album.IDta 

SELECT Right(Genre_Song.name, 4) AS [Жанр песни], Left(Type_Song.name,4) AS [Тип песни], Right(Song.name,4) AS [название песни]
FROM Song
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts

SELECT Artist.lastname AS Имя, ASCII(Country.name) AS Страна, GENRE.name AS [название жанра]
FROM Artist 
JOIN Country ON Artist.IDc = Country.IDc 
JOIN GENRE ON Artist.IDge = GENRE.IDge 

SELECT Genre_Song.name AS [Жанр песни], Type_Song.name AS [Тип песни], Song.name AS [название песни], Replicate(Song.number_song,3) AS [номер песни]
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts

SELECT Artist.lastname AS Имя, Reverse(Country.name) AS Страна, Song.name AS [название песни], Song.number_song AS [номер песни]
FROM Artist 
JOIN Country ON Artist.IDc = Country.IDc
JOIN Song ON Artist.IDa = Song.IDa 

SELECT Upper(Genre_Song.name) AS [Жанр песни], Record.year AS [Год записи], Song.name AS [название песни], Song.number_song AS [номер песни]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 

Select @@IO_BUSY as 'миллисекунд SQL Server ожидала выполнения'
FROM Album 
JOIN Artist ON Album.IDa = Artist.IDa 
JOIN Artist_and_Group ON Artist.IDa = Artist_and_Group.IDa 
JOIN Artist_Group ON Artist_and_Group.IDg = Artist_Group.IDg 

Select @@PACK_SENT AS 'Отправленные пакеты', @@TIMETICKS as 'микросекунд в одном такте процессора'
FROM Album 
JOIN Type_album ON Album.IDta = Type_album.IDta 

Select @@PACKET_ERRORS AS 'неправильных пакетов, принятых', @@TIMETICKS as 'микросекунд в одном такте процессора'
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts