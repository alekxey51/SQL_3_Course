USE LAB4_5

SELECT firstname as [������� �������], lastname as [��� �������], patronymic as[�������� �������]
FROM Artist

SELECT [name] as [����]
FROM GENRE
WHERE [name] <> '�����'

SELECT [name] as [�������� ������], quantity as [����������]
FROM Artist_Group
ORDER BY [name]

SELECT [name] as [���� �����]
FROM Genre_Song
WHERE [name] LIKE '�%'
UNION
SELECT [name] as [���� �����]
FROM Genre_Song
WHERE [name] LIKE '�%'


SELECT [name] as [��� �����]
FROM Type_Song
WHERE [name] IN ('��������� �����','������')

SELECT [name] as [�������� �����], number_song as [����� �����], time_song as[����� �����]
FROM Song
WHERE time_song = 2

SELECT [name] as [�������� �����], number_song as [����� �����], time_song as[����� �����]
FROM Song
WHERE number_song > 5 OR time_song > 2

SELECT [name] as [�������� �����], number_song as [����� �����], time_song as[����� �����]
FROM Song
WHERE number_song BETWEEN 5 AND 7
ORDER BY [name] DESC

SELECT [name] as [�������� �����], number_song as [����� �����], time_song as[����� �����]
FROM Song
WHERE number_song NOT BETWEEN 5 AND 7