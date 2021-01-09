use school;

SELECT firstname AS [Имя], birthday AS [День рождения], class AS [Буква], classnumber AS [Класс], [name] AS [Город]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
WHERE firstname LIKE 'В%' 

SELECT firstname AS [Имя], class AS [Буква], classnumber AS [Класс], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант]
FROM students
JOIN variant ON students.ID = variant.studentID
WHERE housenumber > 30

SELECT firstname AS [Имя], secondname AS [Фамилия], birthday AS [День рождения], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], [name] AS [Город]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
WHERE birthday NOT BETWEEN '2000-10-04' AND '2001-11-06'
ORDER BY birthday

SELECT firstname AS [Имя], birthday AS [День рождения], age AS [Возраст], sex AS [Пол], email AS [Электронная почта], [name] AS [Город], itemname AS [Предмет]
FROM cityes
JOIN items ON cityes.ID = items.ID 
JOIN speciality ON cityes.ID = speciality.ID 
JOIN teachers ON cityes.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID 
WHERE firstname LIKE 'О%'

SELECT secondname AS Фамилия, firstname AS Имя, middlename AS Отчество, birthday AS [Дата рождения], age AS Возраст, sex AS Пол, housenumber AS [Номер дома], roomnumber AS [Номер квартиры], experience AS Стаж, email AS [Адресс электронной почты], category AS Специальность, name AS Город, NumberOfHours AS [Количество часов], itemname AS Предмет, type AS Тип, PickDate AS [Дата выбора]
FROM teachers 
JOIN speciality ON teachers.specialityID = speciality.ID 
JOIN cityes ON teachers.cityID = cityes.ID 
JOIN items ON teachers.itemID = items.ID 
JOIN itemstypes ON items.itemtypeID = itemstypes.ID 
JOIN variant ON items.ID = variant.itemID