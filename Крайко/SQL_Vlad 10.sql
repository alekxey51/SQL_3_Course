USE LAB4_5

SELECT Type_album.name AS [��� �������], COUNT(*) as '���-�� ���������� ��������'
FROM Album 
JOIN Type_album ON Album.IDta = Type_album.IDta 
Group BY Type_album.name

SELECT Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song = (SELECT min(Song.number_song) from Song)

SELECT Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song = (SELECT max(Song.number_song) from Song)

SELECT Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song > (SELECT avg(Song.number_song) from Song)

SELECT Country.name AS ������, COUNT(*) as '���-�� �������� � �������'
FROM Artist
JOIN Country ON Artist.IDc = Country.IDc 
Group BY Country.name
HAVING Country.name <> '�������'

SELECT Genre_Song.name AS [���� �����], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Song
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
where Song.time_song < (SELECT max(Song.time_song) from Song)

SELECT GENRE.name AS [�������� �����], COUNT(*) as '���-�� �������� � ���������� ������'
FROM Artist
JOIN GENRE ON Artist.IDge = GENRE.IDge 

SELECT Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Record.year = (SELECT max(Record.year) from Record)