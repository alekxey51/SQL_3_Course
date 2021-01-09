USE NewBD

SELECT nFIO AS [��� ���������], nVes AS [��� ���������], nVozrast AS [������� ���������], nRost AS [���� ���������], LName AS [������ ������], LMassa AS [����� ������], LSkor AS [�������� ������], LDlina AS [����� ������], LRost AS [���� ������], pName AS ������, TipSkacheck.sName AS [��� ������], sYear AS [��� �������], Skachki.sName AS [�������� ������], sData AS [���� ������], zDlina AS [����� ������], zRezultat AS [��������� ������]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
JOIN Poroda on Poroda.IDPRD = Loshad.IDPRD 
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
ORDER BY nFIO

SELECT nFIO AS [��� ���������], nVozrast AS [������� ���������], LName AS [������ ������], LSkor AS [�������� ������], sYear AS [��� �������]
FROM Sostav
JOIN Loshad on Sostav.IDLoshad = Loshad.IDLoshad
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik
WHERE LName LIKE '�%' 

SELECT LName AS [������ ������], LMassa AS [����� ������], LSkor AS [�������� ������], zDlina AS [����� ������], Skachki.sName AS [�������� ������], sData AS [���� ������], zRezultat AS [��������� ������]
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad
JOIN Skachki on Zabeg.IDLoshad = Skachki.IDSKCH
WHERE zDlina = 3

SELECT Skachki.sName AS [�������� ������], TipSkacheck.sName AS [��� ������], sData AS [���� ������]
FROM TipSkacheck
JOIN Skachki on TipSkacheck.IDTS = Skachki.IDTS
WHERE sData NOT BETWEEN '2020-01-17' AND '2020-02-21'
ORDER BY sData

SELECT LName AS [������ ������], LMassa AS [����� ������], LSkor AS [�������� ������], LDlina AS [����� ������], LRost AS [���� ������], pName AS ������
FROM Loshad 
JOIN Poroda on Loshad.IDPRD = Poroda.IDPRD
WHERE LMassa > 500 AND pName <> '��������'
ORDER BY LName DESC


