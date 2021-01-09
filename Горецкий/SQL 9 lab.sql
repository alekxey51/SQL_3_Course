use school;

SELECT firstname AS [���], birthday AS [���� ��������], class AS [�����], classnumber AS [�����], [name] AS [�����]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
WHERE firstname LIKE '�%' 

SELECT firstname AS [���], class AS [�����], classnumber AS [�����], housenumber AS [����� ����], roomnumber AS [�o��� ��������], variant.ID AS [�������]
FROM students
JOIN variant ON students.ID = variant.studentID
WHERE housenumber > 30

SELECT firstname AS [���], secondname AS [�������], birthday AS [���� ��������], housenumber AS [����� ����], roomnumber AS [�o��� ��������], [name] AS [�����]
FROM cityes
JOIN students ON cityes.ID = students.cityID 
WHERE birthday NOT BETWEEN '2000-10-04' AND '2001-11-06'
ORDER BY birthday

SELECT firstname AS [���], birthday AS [���� ��������], age AS [�������], sex AS [���], email AS [����������� �����], [name] AS [�����], itemname AS [�������]
FROM cityes
JOIN items ON cityes.ID = items.ID 
JOIN speciality ON cityes.ID = speciality.ID 
JOIN teachers ON cityes.ID = teachers.cityID AND items.ID = teachers.itemID AND speciality.ID = teachers.specialityID 
WHERE firstname LIKE '�%'

SELECT secondname AS �������, firstname AS ���, middlename AS ��������, birthday AS [���� ��������], age AS �������, sex AS ���, housenumber AS [����� ����], roomnumber AS [����� ��������], experience AS ����, email AS [������ ����������� �����], category AS �������������, name AS �����, NumberOfHours AS [���������� �����], itemname AS �������, type AS ���, PickDate AS [���� ������]
FROM teachers 
JOIN speciality ON teachers.specialityID = speciality.ID 
JOIN cityes ON teachers.cityID = cityes.ID 
JOIN items ON teachers.itemID = items.ID 
JOIN itemstypes ON items.itemtypeID = itemstypes.ID 
JOIN variant ON items.ID = variant.itemID