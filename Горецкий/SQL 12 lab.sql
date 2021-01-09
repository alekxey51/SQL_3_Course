USE school;

SELECT secondname AS [�������], firstname AS [���], middlename AS [��������], birthday AS [���� ��������], class AS [�����], classnumber AS [�����], housenumber AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������], [name] AS [�����]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
where housenumber = (SELECT min(housenumber) from students)

SELECT secondname AS [�������], firstname AS [���], middlename AS [��������], birthday AS [���� ��������], class AS [�����], classnumber AS [�����], housenumber AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������], [name] AS [�����]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
where housenumber = (SELECT max(housenumber) from students)

SELECT secondname AS [�������], firstname AS [���], middlename AS [��������], birthday AS [���� ��������], class AS [�����], classnumber AS [�����], housenumber AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������], [name] AS [�����]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
where roomnumber = (SELECT max(roomnumber) from students)

--

SELECT secondname AS [�������], firstname AS [���], middlename AS [��������], birthday AS [���� ��������], age AS [�������], sex AS [���], housenumber AS [����� ����], roomnumber AS [����� ��������], experience AS [����], email AS [����������� �����], category AS [�������������], [name] AS [�����], itemname AS [�������]
FROM(SELECT * FROM cityes) �����
JOIN items ON �����.ID = items.ID 
JOIN speciality ON �����.ID = speciality.ID 
JOIN teachers ON �����.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID
ORDER BY secondname

SELECT secondname AS [�������], firstname AS [���], middlename AS [��������], birthday AS [���� ��������], class AS [�����], classnumber AS [�����], housenumber AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������], [name] AS [�����]
FROM (SELECT * FROM cityes) �����
JOIN students ON �����.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
ORDER BY birthday

SELECT secondname AS [�������], firstname AS [���], middlename AS [��������], birthday AS [���� ��������], age AS [�������], sex AS [���], housenumber AS [����� ����], roomnumber AS [����� ��������], experience AS [����], email AS [����������� �����], category AS [�������������], [name] AS [�����], itemname AS [�������]
FROM (SELECT * FROM cityes) �����
JOIN items ON �����.ID = items.ID 
JOIN speciality ON �����.ID = speciality.ID 
JOIN teachers ON �����.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID 
WHERE secondname LIKE '�%'

--

SELECT secondname AS [�������], firstname AS [���], middlename AS [��������], birthday AS [���� ��������], (SELECT min(age) from teachers) AS [�������], sex AS [���], housenumber AS [����� ����], roomnumber AS [����� ��������], experience AS [����], email AS [����������� �����], category AS [�������������], [name] AS [�����], itemname AS [�������]
FROM cityes 
JOIN items ON cityes.ID = items.ID 
JOIN speciality ON cityes.ID = speciality.ID 
JOIN teachers ON cityes.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID 

SELECT secondname AS [�������], firstname AS [���], birthday AS [���� ��������], class AS [�����], classnumber AS [�����], (SELECT max(housenumber) from students) AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������], [name] AS [�����]
FROM cityes 
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID

SELECT secondname AS [�������], middlename AS [��������], class AS [�����], classnumber AS [�����], (SELECT avg(housenumber) from students) AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������], [name] AS [�����]
FROM cityes 
JOIN students ON cityes.ID = students.cityID 
JOIN variant ON students.ID = variant.studentID
