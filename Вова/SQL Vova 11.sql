use Vova_5

--��������������
SELECT sin(sum(�������������)) AS [����� �����], avg(DATEDIFF(day,����������, GETDATE())) AS [������� ����� ���� �����]
FROM �����
JOIN ������� on �������.ID������� = �����.ID�������
JOIN ����������� on �������.ID�� = �����������.ID�� 

SELECT ���, �������, DateName(Month, ������������) as [�����], sqrt(��������������) as [������ �������]
FROM �����
JOIN ������ on �����.ID����� = ������.ID�����
JOIN ����� on ������.ID������� = �����.ID�������

SELECT ���, sUM(power(��������������, 2)) AS [����� ������� � 2-� �������]
FROM ������
JOIN ����� on ������.ID������� = �����.ID�������
GROUP BY ���

--������� ������ � ������
SELECT ���, DATEDIFF(Month,����������, GETDATE()) as [������ ������� ������ ��� �����]
FROM ������
JOIN ����� on ������.ID������� = �����.ID�������
where DATEDIFF(Month,����������, GETDATE()) > 10

SELECT ���, DATEDIFF(day,������������, GETDATE()) as [������ ������� ���� �����], DateName(Month, ����������) as [�����], ��������������
FROM �����
JOIN ������ on �����.ID����� = ������.ID�����
JOIN ����� on ������.ID������� = �����.ID�������

SELECT ���, DATEDIFF(Month,����������, GETDATE()) as [������ ������� ������ ��� �����], ��������������
FROM ������
JOIN ����� on ������.ID������� = �����.ID�������

--��������� �������
SELECT ASCII(�������.��������) as [��� ASCII �������� ��������], �����������.�������� as [��� ��������], ����������
FROM �����
JOIN ������� on �������.ID������� = �����.ID�������
JOIN ����������� on �������.ID�� = �����������.ID�� 

SELECT CHARINDEX('�.�.', ���), ������������, �����.�������� as [�������� ������], ����������, CHAR(��������������)
FROM �����
JOIN ������ on �����.ID����� = ������.ID�����
JOIN ����� on ������.ID������� = �����.ID�������

SELECT Right(���, 4), ������������, Left(�������.��������, 5) as [�������� ��������], �������������
FROM ������
JOIN ����� on ������.ID������� = �����.ID�������
JOIN ������� on �������.ID������� = �����.ID�������

--�������������� �������
Select @@IO_BUSY as '����������� SQL Server ������� ����������'
FROM �����
JOIN ������� on �������.ID������� = �����.ID�������
JOIN ����������� on �������.ID�� = �����������.ID�� 

Select @@PACK_SENT AS '������������ ������', @@TIMETICKS as '����������� � ����� ����� ����������'
FROM �����
JOIN ������ on �����.ID����� = ������.ID�����
JOIN ����� on ������.ID������� = �����.ID�������

Select @@PACKET_ERRORS AS '������������ �������, ��������', @@TIMETICKS as '����������� � ����� ����� ����������'
FROM ������
JOIN ����� on ������.ID������� = �����.ID�������
JOIN ������� on �������.ID������� = �����.ID�������