USE LAB4_5

SELECT Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.time_song = (SELECT min(Song.time_song) from Song)

SELECT Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song = (SELECT max(Song.number_song) from Song)

SELECT Record.year AS [��� ������], Song.name AS [�������� �����], Song.number_song AS [����� �����], Song.time_song AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
where Song.number_song > (SELECT avg(Song.number_song) from Song)

SELECT Genre_Song.name AS [���� �����], Type_Song.name AS [��� �����], ����.name AS [�������� �����], ����.number_song AS [������ �����]
FROM (SELECT * FROM Song) ����
JOIN Genre_Song ON ����.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON ����.IDts = Type_Song.IDts
ORDER BY Genre_Song.name

SELECT ������.name AS [�������� �������], ������.quantity AS [�����], Record.year AS [��� ������]
FROM (SELECT * FROM Album) ������
JOIN Record ON ������.IDa = Record.IDa 
ORDER BY ������.name

SELECT ������.firstname AS �������, ������.lastname AS ���, ������.patronymic AS ��������, GENRE.name AS [�������� �����]
FROM (SELECT * FROM Artist) ������
JOIN GENRE ON ������.IDge = GENRE.IDge 
WHERE ������.firstname LIKE '�%'

SELECT Genre_Song.name AS [���� �����], Type_Song.name AS [��� �����], Song.name AS [�������� �����], (SELECT min(number_song) from Song) AS [����� �����]
FROM Song 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 
JOIN Type_Song ON Song.IDts = Type_Song.IDts

SELECT Artist.lastname AS ���, Country.name AS ������, Song.name AS [�������� �����], (SELECT max(number_song) from Song) AS [����� �����]
FROM Artist 
JOIN Country ON Artist.IDc = Country.IDc
JOIN Song ON Artist.IDa = Song.IDa 

SELECT Genre_Song.name AS [���� �����], Record.year AS [��� ������], Song.name AS [�������� �����], (SELECT avg(number_song) from Song) AS [����� �����]
FROM Record 
JOIN Song ON Record.IDs = Song.IDs 
JOIN Genre_Song ON Song.IDgs = Genre_Song.IDgs 