USE NewBD

SELECT TipSkacheck.sName, count(*) as '���-�� ����������� ������'
FROM Skachki JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS
Group BY TipSkacheck.sName 
HAVING COUNT(*) >= 2

SELECT sData AS [���� ������], count(*) as '���-�� ������ � ������������ ����'
FROM Zabeg
JOIN Skachki on Zabeg.IDSKCH = Skachki.IDSKCH
Group BY sData
HAVING sData <> '2020-01-17'

SELECT zRezultat AS [��������� ������], count(*) as '���-�� ������� ����'
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
Group BY zRezultat

SELECT LName AS [������ ������], LMassa AS [����� ������], LSkor AS [�������� ������], LDlina AS [����� ������], LRost AS [���� ������], pName AS ������
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where LMassa = (SELECT MAX(LMassa) from Loshad)

SELECT LName AS [������ ������], LMassa AS [����� ������], LSkor AS [�������� ������], pName AS ������
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where LMassa > (SELECT avg(LMassa) from Loshad)

SELECT LName AS [������ ������], LSkor AS [�������� ������], pName AS ������
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where LSkor = (SELECT min(LSkor) from Loshad)

SELECT nFIO AS [��� ���������], nVes AS [��� ���������], nVozrast AS [������� ���������], sYear AS [��� �������]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
where nVes < (SELECT avg(nVes) from Naeznik)

SELECT nFIO AS [��� ���������], nVozrast AS [������� ���������], sYear AS [��� �������]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
where nVozrast > (SELECT MIN(nVozrast) from Naeznik)