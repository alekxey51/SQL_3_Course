use school;

SELECT COUNT(*) AS [Количество преподавателей мужского пола], sex AS [Пол]
FROM teachers 
JOIN cityes ON cityID = cityes.ID
GROUP BY sex
HAVING sex = 'М'

SELECT category AS [Специальность], count(*) as [Кол-во специалистов]
FROM teachers 
JOIN speciality ON specialityID =  speciality.ID
GROUP BY category 

SELECT COUNT(*) AS [Количество вариантов], variant.ID as [Вариант]
FROM students 
JOIN variant ON students.ID = dbo.variant.studentID
GROUP BY variant.ID

SELECT firstname AS [Имя], birthday AS [День рождения], class AS [Буква], classnumber AS [Класс], [name] AS [Город]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
where classnumber = (SELECT min(classnumber) from students)

SELECT firstname AS [Имя], class AS [Буква], classnumber AS [Класс], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], variant.ID AS [Вариант]
FROM students
JOIN variant ON students.ID = variant.studentID
where housenumber = (SELECT max(housenumber) from students)

SELECT firstname AS [Имя], secondname AS [Фамилия], birthday AS [День рождения], housenumber AS [Номер дома], roomnumber AS [Нoмер квартиры], [name] AS [Город]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
where roomnumber > (SELECT avg(roomnumber) from students)

SELECT classnumber AS [Класс], Count(*) as [Количество классов]
FROM students
JOIN variant ON students.ID = variant.studentID
GROUP BY classnumber

SELECT Year(birthday) AS [День рождения], Count(*) as [Количество студентов родившехся в одинаковый год]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
GROUP BY Year(birthday)

