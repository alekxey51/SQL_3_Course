create database VladBD
use VladBD

create table �������������
(ID���� int not null identity,
�������� varchar(50) not null default '�� �������',
constraint CS_PK primary key (ID����))
alter table ������������� add constraint CS_Check check (�������� = '����������' or �������� = '����' or �������� = '��������' or �������� = '���������'  or �������� = '�������-��������' or �������� = '���������')

insert into ������������� (��������) values ('����������')
insert into ������������� (��������) values ('����')
insert into ������������� (��������) values ('��������')
insert into ������������� (��������) values ('���������')
insert into ������������� (��������) values ('�������-��������')

update ������������� set ��������='���������' where ��������='�������-��������'

------

create table �����
(ID����� int not null identity,
�������� varchar(50) not null default '�� �������',
constraint CS_PK1 primary key (ID�����),
constraint CS_Check1 check (�������� = '�����' or �������� = '������' or �������� = '������' or �������� = '�����' or �������� = '������' or �������� = '������' or �������� = '�������'))

insert into ����� (��������) values ('�����')
insert into ����� (��������) values ('������')
insert into ����� (��������) values ('������')
insert into ����� (��������) values ('�����')
insert into ����� (��������) values ('������')

update ����� set ��������='������' where ��������='�����'
update ����� set ��������='�������' where ��������='������'

-------

create table �������
(ID������� int not null identity,
[��� ��������] varchar(50) not null default '�� �������',
��� char not null,
[��� ��������] int not null,
���� int not null default 0,
ID���� int not null default 0,
ID����� int not null default 0,
constraint CS_Check2 check (���='�' or ���='�'),
constraint CS_Check3 check (����>=0 and ����<=5),
constraint CS_Check4 check ([��� ��������]>=1900 and [��� ��������]<=2020),
constraint CS_PK2 primary key (ID�������),
constraint CS_FK foreign key(ID����) references �������������(ID����) on delete cascade on update cascade,
constraint CS_FK1 foreign key(ID�����) references �����(ID�����) on delete cascade on update cascade)

insert into ������� ([��� ��������], ���, [��� ��������], ����, ID����, ID�����) values ('����', '�', 2015, 2, 1, 2)
insert into ������� ([��� ��������], ���, [��� ��������], ����, ID����, ID�����)  values ('�����', '�', 2010, 4, 3, 3)
insert into ������� ([��� ��������], ���, [��� ��������], ����, ID����, ID�����)  values ('�������', '�', 2003, 5, 4, 4)
insert into ������� ([��� ��������], ���, [��� ��������], ����, ID����, ID�����)  values ('��������', '�', 2007, 3, 5, 2)
insert into ������� ([��� ��������], ���, [��� ��������], ����, ID����, ID�����)  values ('���������', '�', 2015, 1, 1, 5)

update ������� set [��� ��������]='������' where [��� ��������]='����'
update ������� set [��� ��������]=2005 where [��� ��������]=2007
update ������� set ����=2 where ����=1

-------

create table �������������
(ID������ int not null identity,
��� varchar(50) not null default '�� �������',
[���� ��������] date not null,
constraint CS_Check5 check ([���� ��������] >='1900-01-01' and [���� ��������] <='2020-04-16'),
constraint CS_PK3 primary key (ID������))

insert into ������������� (���, [���� ��������]) values ('������ ������� ����������', '1999-04-16')
insert into ������������� (���, [���� ��������]) values ('���������� ������� ���������', '1990-01-20')
insert into ������������� (���, [���� ��������]) values ('�������� ��� ���������', '1995-08-20')
insert into ������������� (���, [���� ��������]) values ('�������� ������ ��������', '1990-11-21')
insert into ������������� (���, [���� ��������]) values ('������ ����� ��������', '1975-03-01')

update ������������� set ���='�������� ����� ��������' where ���='�������� ��� ���������'
update ������������� set [���� ��������]='1990-10-19' where [���� ��������]='1990-11-21'

------

create table �����������
(ID��� int not null identity,
�������� varchar(50) not null default '�� �������',
constraint CS_PK4 primary key (ID���))

insert into ����������� (��������) values ('������������')
insert into ����������� (��������) values ('������������')
insert into ����������� (��������) values ('������ �����')
insert into ����������� (��������) values ('������������')
insert into ����������� (��������) values ('�����������')

update ����������� set ��������='����������' where ��������='������������'

------

create table ��������
(ID������� int not null identity,
�������� varchar(50) not null default '�� �������',
�������� varchar(200) not null,
ID������ int not null default 0,
ID��� int not null default 0,
constraint CS_PK5 primary key (ID�������),
constraint CS_FK2 foreign key(ID������) references �������������(ID������) on delete cascade on update cascade,
constraint CS_FK3 foreign key(ID���) references �����������(ID���) on delete cascade on update cascade)

insert into �������� (��������, ��������, ID������, ID���) values ('�������', '������� ������, � ����� ������������ �����, ������������ ��������� �������� � �������.', 1, 2)
insert into �������� (��������, ��������, ID������, ID���) values ('����������', '� ������� ������ ����� ������������ ����� ���������� �������', 2, 5)
insert into �������� (��������, ��������, ID������, ID���) values ('�����������', '������� ���������� ������������, ������������ �� ���������� � ���������� ��������, ', 3, 4)
insert into �������� (��������, ��������, ID������, ID���) values ('����������', '����� �� ���������� ����� ���������, � ������� ������ �� ��������', 4, 3)
insert into �������� (��������, ��������, ID������, ID���) values ('���������', '�������� ������������ � ������������ ����, ���������� ���������,', 1, 2)

update �������� set ��������='��������' where ��������='�������'
update �������� set ��������='����� � ����� ��������� � �� �������������� �� ������ ��������.' where ��������='������� ������, � ����� ������������ �����, ������������ ��������� �������� � �������.'

-------

create table ����������������������
(ID����� int not null identity,
�������� varchar(50) not null default '�� �������',
constraint CS_PK6 primary key (ID�����))

insert into ���������������������� (��������) values ('-----')
insert into ���������������������� (��������) values ('*****')
insert into ���������������������� (��������) values ('/////')
insert into ���������������������� (��������) values ('|||||')
insert into ���������������������� (��������) values ('\\\\\')

-------

create table �������
(ID������� int not null identity,
��������� int not null,
���� date not null,
ID������� int not null default 0,
ID������� int not null default 0,
ID����� int not null default 0,
constraint CS_Check6 check (���� >='2020-01-01' and ���� <='2020-04-16'),
constraint CS_PK7 primary key (ID�������),
constraint CS_FK4 foreign key(ID�������) references �������(ID�������) on delete cascade on update cascade,
constraint CS_FK5 foreign key(ID�������) references ��������(ID�������) on delete cascade on update cascade,
constraint CS_FK6 foreign key(ID�����) references ����������������������(ID�����) on delete cascade on update cascade)

insert into ������� (���������, ����, ID�������, ID�������, ID�����) values ( 5, '2020-02-09', 1, 1, 1)
insert into ������� (���������, ����, ID�������, ID�������, ID�����) values ( 8, '2020-03-29', 2, 3, 2)
insert into ������� (���������, ����, ID�������, ID�������, ID�����) values ( 9, '2020-02-11', 3, 4, 3)
insert into ������� (���������, ����, ID�������, ID�������, ID�����) values ( 4, '2020-01-26', 3, 5, 4)
insert into ������� (���������, ����, ID�������, ID�������, ID�����) values ( 7, '2020-02-10', 1, 1, 5)

update ������� set ���������=10 where ���������=5
update ������� set ����='2020-01-02' where ����='2020-02-09'


--SELECT        TOP (100) PERCENT dbo.�������.[��� ��������], dbo.�������.���, dbo.�������.[��� ��������], dbo.�������.����, dbo.�����.�������� AS [�������� ������], dbo.�������������.�������� AS �������������, 
--                         dbo.����������������������.�������� AS [����� �������� ���������], dbo.��������.�������� AS �������, dbo.��������.��������, dbo.�����������.�������� AS [��� ��������], dbo.�������������.���, 
--                         dbo.�������������.[���� ��������], dbo.�������.���������, dbo.�������.����
--FROM            dbo.����������� INNER JOIN
--                         dbo.������������� INNER JOIN
--                         dbo.�������� ON dbo.�������������.ID������ = dbo.��������.ID������ ON dbo.�����������.ID��� = dbo.��������.ID��� INNER JOIN
--                         dbo.������� ON dbo.��������.ID������� = dbo.�������.ID������� INNER JOIN
--                         dbo.������� INNER JOIN
--                         dbo.����� ON dbo.�������.ID����� = dbo.�����.ID����� INNER JOIN
--                         dbo.������������� ON dbo.�������.ID���� = dbo.�������������.ID���� ON dbo.�������.ID������� = dbo.�������.ID������� INNER JOIN
--                         dbo.���������������������� ON dbo.�������.ID����� = dbo.����������������������.ID�����
--WHERE        (dbo.�������.��� = '�')
--ORDER BY dbo.�������.[��� ��������], ������� DESC
