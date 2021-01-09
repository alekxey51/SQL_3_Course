USE LAB4_5

------------------------------

SELECT Genre_Song.name AS [���� �����], Type_Song.name AS [��� �����], Song.name AS [�������� �����], sin(Song.number_song) AS [����� ������ �����]
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts
ORDER BY Genre_Song.name

SELECT Album.name AS [�������� �������], sqrt(Album.quantity) AS [������ �����], Record.year AS [��� ������]
FROM Album 
JOIN Record ON Album.IDa = Record.IDa 
ORDER BY Album.name

SELECT Artist.lastname AS ���, GENRE.name AS [�������� �����], power(Artist_Group.quantity,2) AS [����� ������ � 2-� �������]
FROM Artist
JOIN Artist_and_Group ON Artist.IDa = Artist_and_Group.IDa 
JOIN Artist_Group ON Artist_and_Group.IDg = Artist_Group.IDg 
JOIN GENRE ON Artist.IDge = GENRE.IDge 

SELECT ASCII(Album.name) AS [�������� �������], Album.year AS [��� �������], Album.quantity AS �����, Record.year AS [��� ������], Type_album.name AS [��� �������]
FROM Album 
JOIN Record ON Album.IDa = Record.IDa 
JOIN Type_album ON Album.IDta = Type_album.IDta 

SELECT Right(Genre_Song.name, 4) AS [���� �����], Left(Type_Song.name,4) AS [��� �����], Right(Song.name,4) AS [�������� �����]
FROM Song
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts

SELECT Artist.lastname AS ���, ASCII(Country.name) AS ������, GENRE.name AS [�������� �����]
FROM Artist 
JOIN Country ON Artist.IDc = Country.IDc 
JOIN GENRE ON Artist.IDge = GENRE.IDge 

SELECT Genre_Song.name AS [���� �����], Type_Song.name AS [��� �����], Song.name AS [�������� �����], Replicate(Song.number_song,3) AS [����� �����]
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts

SELECT Artist.lastname AS ���, Reverse(Country.name) AS ������, Song.name AS [�������� �����], Song.number_song AS [����� �����]
FROM Artist 
JOIN Country ON Artist.IDc = Country.IDc
JOIN Song ON Artist.IDa = Song.IDa 

SELECT Upper(Genre_Song.name) AS [���� �����], Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 

Select @@IO_BUSY as '����������� SQL Server ������� ����������'
FROM Album 
JOIN Artist ON Album.IDa = Artist.IDa 
JOIN Artist_and_Group ON Artist.IDa = Artist_and_Group.IDa 
JOIN Artist_Group ON Artist_and_Group.IDg = Artist_Group.IDg 

Select @@PACK_SENT AS '������������ ������', @@TIMETICKS as '����������� � ����� ����� ����������'
FROM Album 
JOIN Type_album ON Album.IDta = Type_album.IDta 

Select @@PACKET_ERRORS AS '������������ �������, ��������', @@TIMETICKS as '����������� � ����� ����� ����������'
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts