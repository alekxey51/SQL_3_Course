USE LAB4_5

SELECT firstname as [Фамилия артиста], lastname as [Имя артиста], patronymic as[Отчество артиста]
FROM Artist

SELECT [name] as [Жанр]
FROM GENRE
WHERE [name] <> 'Гавот'

SELECT [name] as [Название группы], quantity as [Количество]
FROM Artist_Group
ORDER BY [name]

SELECT [name] as [Жанр песни]
FROM Genre_Song
WHERE [name] LIKE 'Н%'
UNION
SELECT [name] as [Жанр песни]
FROM Genre_Song
WHERE [name] LIKE 'м%'


SELECT [name] as [Тип песни]
FROM Type_Song
WHERE [name] IN ('Эстрадная песня','Шансон')

SELECT [name] as [Название песни], number_song as [Номер песни], time_song as[Время песни]
FROM Song
WHERE time_song = 2

SELECT [name] as [Название песни], number_song as [Номер песни], time_song as[Время песни]
FROM Song
WHERE number_song > 5 OR time_song > 2

SELECT [name] as [Название песни], number_song as [Номер песни], time_song as[Время песни]
FROM Song
WHERE number_song BETWEEN 5 AND 7
ORDER BY [name] DESC

SELECT [name] as [Название песни], number_song as [Номер песни], time_song as[Время песни]
FROM Song
WHERE number_song NOT BETWEEN 5 AND 7