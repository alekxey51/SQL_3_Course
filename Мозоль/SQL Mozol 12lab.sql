USE NewBD

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

-------------------

SELECT LName AS [������ ������], (SELECT min(LSkor) from Loshad) AS [�������� ������], pName AS ������
FROM Loshad 
JOIN Poroda on Loshad.IDPRD  = Poroda.IDPRD
where pName <> '�������'

SELECT nFIO AS [��� ���������], (SELECT avg(nVes) from Naeznik) AS [��� ���������], nVozrast AS [������� ���������], sYear AS [��� �������]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
WHERE sYear NOT BETWEEN 2017 AND 2018

SELECT nFIO AS [��� ���������], (SELECT MIN(nVozrast) from Naeznik) AS [������� ���������], sYear AS [��� �������]
FROM Sostav 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
WHERE sYear BETWEEN 2017 AND 2018

-----------------------

SELECT Naeznik.nFIO AS [��� ���������], Naeznik.nVes AS [��� ���������], Naeznik.nVozrast AS [������� ���������], sYear AS [��� �������]
FROM (SELECT * FROM Sostav) Sostav2 
JOIN Naeznik on Sostav2.IDNaeznik = Naeznik.IDNaeznik
ORDER BY nFIO

SELECT Skachki.sName AS [�������� ������], Tip.sName AS [��� ������], Skachki.sData AS [���� ������]
FROM (SELECT * FROM TipSkacheck) Tip
JOIN Skachki on Tip.IDTS = Skachki.IDTS

SELECT Losh.LName AS [������ ������], Losh.LMassa AS [����� ������], Losh.LSkor AS [�������� ������], Poroda.pName AS ������
FROM (SELECT * FROM Loshad) Losh
JOIN Poroda on Losh.IDPRD = Poroda.IDPRD
WHERE Losh.LMassa > 500 AND Poroda.pName <> '��������'
ORDER BY Losh.LName DESC