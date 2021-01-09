use Vova_5

SELECT ���, ���, (SELECT avg(�������) from ������), �����.�������� as [�������� ������]
FROM ������
JOIN ����� on ������.ID����� = �����.ID�����
WHERE ��� = '�'

SELECT ���, ���, (SELECT min(�������) from ������), ������������, �����.�������� as [�������� ������]
FROM ������
JOIN ����� on ������.ID����� = �����.ID�����
WHERE �����.��������  <> '�����'

SELECT ���, ���, (SELECT max(�������) from ������), �����.�������� as [�������� ������]
FROM ������
JOIN ����� on ������.ID����� = �����.ID�����

SELECT Ychenic.���, Ychenic.���, Ychenic.�������, Ychenic.������������, �����.�������� as [�������� ������]
FROM (SELECT * FROM ������) Ychenic
JOIN ����� on Ychenic.ID����� = �����.ID�����
WHERE Ychenic.��� = '�'
ORDER BY Ychenic.������� DESC

SELECT Predmet.�������� as [�������� ��������], �������������, �����������.�������� as [��� ��������]
FROM (SELECT * FROM �������) Predmet
JOIN ����������� on Predmet.ID�� = �����������.ID��
WHERE �����������.�������� <> '������ �����' and Predmet.�������� LIKE '�%' 
ORDER BY �������������

SELECT ���,  �������.�������� as [�������� ��������], Vbor.��������������
FROM (SELECT * FROM �����) Vbor
JOIN ������� on Vbor.ID������� = �������.ID�������
JOIN ������ on Vbor.ID������� = ������.ID�������
WHERE Vbor.�������������� > 4 and �������.�������� <> '�����������'

SELECT ���, ���, �������, ������������, �����.�������� as [�������� ������]
FROM ������
JOIN ����� on ������.ID����� = �����.ID�����
where ������� = (SELECT min(�������) from ������)

SELECT ���, ���, �������, �����.�������� as [�������� ������]
FROM ������
JOIN ����� on ������.ID����� = �����.ID�����
where ������� = (SELECT max(�������) from ������)

SELECT �������.�������� as [�������� ��������], �������������, �����������.�������� as [��� ��������]
FROM �������
JOIN ����������� on �������.ID�� = �����������.ID�� 
where ������������� > (SELECT avg(�������������) from �������)