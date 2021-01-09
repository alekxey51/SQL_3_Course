USE school;

SELECT secondname AS [Фамилия], firstname AS [Имя], middlename AS [Отчество], birthday AS [День рождения], class AS [Буква], classnumber AS [Класс], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант], [name] AS [Город]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
where housenumber = (SELECT min(housenumber) from students)

SELECT secondname AS [Фамилия], firstname AS [Имя], middlename AS [Отчество], birthday AS [День рождения], class AS [Буква], classnumber AS [Класс], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант], [name] AS [Город]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
where housenumber = (SELECT max(housenumber) from students)

SELECT secondname AS [Фамилия], firstname AS [Имя], middlename AS [Отчество], birthday AS [День рождения], class AS [Буква], classnumber AS [Класс], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант], [name] AS [Город]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
where roomnumber = (SELECT max(roomnumber) from students)

--

SELECT secondname AS [Фамилия], firstname AS [Имя], middlename AS [Отчество], birthday AS [День рождения], age AS [Возраст], sex AS [Пол], housenumber AS [Номер дома], roomnumber AS [Номер квартиры], experience AS [Стаж], email AS [Электронная почта], category AS [Специальность], [name] AS [Город], itemname AS [Предмет]
FROM(SELECT * FROM cityes) Город
JOIN items ON Город.ID = items.ID 
JOIN speciality ON Город.ID = speciality.ID 
JOIN teachers ON Город.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID
ORDER BY secondname

SELECT secondname AS [Фамилия], firstname AS [Имя], middlename AS [Отчество], birthday AS [День рождения], class AS [Буква], classnumber AS [Класс], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант], [name] AS [Город]
FROM (SELECT * FROM cityes) Город
JOIN students ON Город.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
ORDER BY birthday

SELECT secondname AS [Фамилия], firstname AS [Имя], middlename AS [Отчество], birthday AS [День рождения], age AS [Возраст], sex AS [Пол], housenumber AS [Номер дома], roomnumber AS [Номер квартиры], experience AS [Стаж], email AS [Электронная почта], category AS [Специальность], [name] AS [Город], itemname AS [Предмет]
FROM (SELECT * FROM cityes) Город
JOIN items ON Город.ID = items.ID 
JOIN speciality ON Город.ID = speciality.ID 
JOIN teachers ON Город.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID 
WHERE secondname LIKE 'М%'

--

SELECT secondname AS [Фамилия], firstname AS [Имя], middlename AS [Отчество], birthday AS [День рождения], (SELECT min(age) from teachers) AS [Возраст], sex AS [Пол], housenumber AS [Номер дома], roomnumber AS [Номер квартиры], experience AS [Стаж], email AS [Электронная почта], category AS [Специальность], [name] AS [Город], itemname AS [Предмет]
FROM cityes 
JOIN items ON cityes.ID = items.ID 
JOIN speciality ON cityes.ID = speciality.ID 
JOIN teachers ON cityes.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID 

SELECT secondname AS [Фамилия], firstname AS [Имя], birthday AS [День рождения], class AS [Буква], classnumber AS [Класс], (SELECT max(housenumber) from students) AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант], [name] AS [Город]
FROM cityes 
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID

SELECT secondname AS [Фамилия], middlename AS [Отчество], class AS [Буква], classnumber AS [Класс], (SELECT avg(housenumber) from students) AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант], [name] AS [Город]
FROM cityes 
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
