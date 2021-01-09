USE LAB4_5

SELECT Album.name AS [�������� �������], Album.year AS [��� �������], Album.quantity AS �����, Genre_Song.name AS [���� �����], Type_Song.name AS [��� �����], Artist.firstname AS �������, Artist.lastname AS ���, Artist.patronymic AS ��������, Record.year AS [��� ������], Country.name AS ������, Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����], Type_album.name AS [��� �������], GENRE.name AS [�������� �����], Artist_Group.name AS [�������� ������], Artist_Group.quantity AS [����� ������]
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

SELECT Type_Song.name AS [��� �����], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Song 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
WHERE Song.number_song > 5 AND Song.name <> '�������'
ORDER BY Type_Song.name DESC

SELECT Artist.firstname AS �������, Artist.lastname AS ���, Artist.patronymic AS ��������, GENRE.name AS [�������� �����]
FROM Artist
JOIN GENRE ON Artist.IDge = GENRE.IDge 
WHERE Artist.firstname LIKE '�%'

SELECT Type_Song.name AS [��� �����], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Song 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
WHERE Song.number_song NOT BETWEEN 5 AND 7
ORDER BY Type_Song.name

SELECT Type_Song.name AS [��� �����], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Song 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
WHERE Song.number_song BETWEEN 5 AND 7