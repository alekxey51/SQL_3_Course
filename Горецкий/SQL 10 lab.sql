use school;

SELECT COUNT(*) AS [���������� �������������� �������� ����], sex AS [���]
FROM teachers 
JOIN cityes ON cityID = cityes.ID
GROUP BY sex
HAVING sex = '�'

SELECT category AS [�������������], count(*) as [���-�� ������������]
FROM teachers 
JOIN speciality ON specialityID =  speciality.ID
GROUP BY category 

SELECT COUNT(*) AS [���������� ���������], variant.ID as [�������]
FROM students 
JOIN variant ON students.ID = dbo.variant.studentID
GROUP BY variant.ID

SELECT firstname AS [���], birthday AS [���� ��������], class AS [�����], classnumber AS [�����], [name] AS [�����]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
where classnumber = (SELECT min(classnumber) from students)

SELECT firstname AS [���], class AS [�����], classnumber AS [�����], housenumber AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������]
FROM students
JOIN variant ON students.ID = variant.studentID
where housenumber = (SELECT max(housenumber) from students)

SELECT firstname AS [���], secondname AS [�������], birthday AS [���� ��������], housenumber AS [����� ����], roomnumber AS [�o��� ��������], [name] AS [�����]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
where roomnumber > (SELECT avg(roomnumber) from students)

SELECT classnumber AS [�����], Count(*) as [���������� �������]
FROM students
JOIN variant ON students.ID = variant.studentID
GROUP BY classnumber

SELECT Year(birthday) AS [���� ��������], Count(*) as [���������� ��������� ���������� � ���������� ���]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
GROUP BY Year(birthday)

