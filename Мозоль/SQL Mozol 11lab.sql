USE NewBD

SELECT LName AS [������ ������], LMassa AS [����� ������], LSkor AS [�������� ������],  
Skachki.sName AS [�������� ������], sData AS [���� ������], zRezultat AS [��������� ������], DATEDIFF(day,sData, GETDATE()) AS [������ ���� ���� �����]
FROM Skachki
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT LName AS [������ ������], Skachki.sName AS [�������� ������], sData AS [���� ������], 
zRezultat AS [��������� ������], DATEDIFF(Month,sData, GETDATE()) AS [������ ���� ��� �����]
FROM Skachki
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT pName AS ������, sum(LMassa) AS [����� ���� �������]
FROM Loshad
JOIN Poroda on Loshad.IDPRD = Poroda.IDPRD
Group by pName

SELECT LName AS [������ ������], exp(LSkor) AS [���������� �������� ������], lower(zRezultat) AS [��������� ������]
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT LName AS [������ ������], power(LSkor,2) AS [�������� ������ �� 2-� �������], pName AS ������, 
sqrt(zDlina) AS [���������� ������ ����� ������], zRezultat AS [��������� ������]
FROM Zabeg
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
JOIN Poroda on Poroda.IDPRD = Loshad.IDPRD 

Select @@IDLE as '����������� � ������� SQL'
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT LName AS [������ ������], sin(LMassa) AS [����� ������],  SUBSTRING(TipSkacheck.sName, 1, 6) AS [��� ������], 
Upper(Skachki.sName) AS [�������� ������], sData AS [���� ������], zRezultat AS [��������� ������]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 

SELECT Skachki.sName AS [�������� ������], TipSkacheck.sName AS [��� ������], Year(sData) AS [��� ������], DateName(Month, sData) as [����� ������], 
zDlina AS [����� ������]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH

SELECT charindex('�',LName,1) AS [������ ������], sin(LMassa) AS [����� ������], sYear AS [��� �������], charindex('������', zRezultat) AS [����� 2-� ����� � ����������]
FROM Zabeg 
JOIN Loshad on Zabeg.IDLoshad = Loshad.IDLoshad 
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 

SELECT upper(nFIO) AS [��� ���������], square(nVes) AS [��� ��������� � ��������], nVozrast AS [������� ���������], LName AS [������ ������], LMassa AS [����� ������], sYear AS [��� �������]
FROM Loshad
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik

Select @@PACK_SENT AS '������������ ������', @@TIMETICKS as '����������� � ����� ����� ����������'
FROM Loshad
JOIN Poroda on Poroda.IDPRD = Loshad.IDPRD 
JOIN Sostav on Sostav.IDLoshad = Loshad.IDLoshad 
JOIN Naeznik on Sostav.IDNaeznik = Naeznik.IDNaeznik

SELECT ASCII(TipSkacheck.sName) AS [��� ������ (��� ASCII)], Skachki.sName AS [�������� ������], DateName(Month, sData) AS [����� ������], zRezultat AS [��������� ������]
FROM Skachki
JOIN TipSkacheck on Skachki.IDTS = TipSkacheck.IDTS 
JOIN Zabeg on Skachki.IDSKCH = Zabeg.IDSKCH


