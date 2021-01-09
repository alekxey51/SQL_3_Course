create database Vova_5
use Vova_5

create table �����������
(ID�� int not null identity,
�������� varchar(50) not null default '�� �������',
constraint CS_PK primary key (ID��),
constraint CS_Check check (�������� = '������ �����' or �������� = '�����������' or �������� = '������������' or �������� = '������������' or �������� = '������������' or �������� = '����������'))

insert into ����������� (��������) values ('������ �����')
insert into ����������� (��������) values ('�����������')
insert into ����������� (��������) values ('������������')
insert into ����������� (��������) values ('������������')
insert into ����������� (��������) values ('������������')

update ����������� set ��������='����������' where ��������='������������'

-------------------------------------

create table �����
(ID����� int not null identity,
�������� varchar(50) not null default '�� �������',
constraint CS_PK1 primary key (ID�����))

alter table ����� add constraint CS_Check1 check (�������� = '�����' or �������� = '������' or �������� = '������' or �������� = '�����' or �������� = '������' or �������� = '������' or �������� = '�������')

insert into ����� (��������) values ('�����')
insert into ����� (��������) values ('������')
insert into ����� (��������) values ('�����')
insert into ����� (��������) values ('������')
insert into ����� (��������) values ('������')

update ����� set ��������='�������' where ��������='������'
update ����� set ��������='������' where ��������='�����'

-------------------------------------

create table ������
(ID������� int not null,
��� varchar(50) not null default '�� �������',
��� varchar(1) not null default '�� �������',
������� int not null default 7,
������������ date not null default '1950-01-01',
ID����� int not null,
constraint CS_PK2 primary key (ID�������),
constraint CS_FK1 foreign key(ID�����) references �����(ID�����) on delete cascade on update cascade,
constraint CS_Check2 check (���='�' or ���='�'),
constraint CS_Check3 check (�������>=7 and �������<=30),
constraint CS_Check4 check (������������>='1950-01-01' and ������������<='2020-03-26'))

insert into ������ values (235614, '����������� �.�.', '�', 16, '2004-04-23', 1)
insert into ������ values (235615, '������������ �.�.', '�', 18, '2002-06-30', 3)
insert into ������ values (235616, '������ �.�.', '�', 17, '2000-11-01', 3)
insert into ������ values (235617, '���� �.�.', '�', 15, '2005-01-10', 4)
insert into ������ values (235618, '������������ �.�.', '�', 18, '2002-06-30', 3)
insert into ������ values (235619, '������ �.�.', '�', 17, '2000-11-01', 3)
insert into ������ values (235620, '���� �.�.', '�', 15, '2005-01-10', 4)
insert into ������ values (235621, '�������� �.�.', '�', 19, '2001-08-21', 5)

update ������ set ���='������� �.�.' where ���='������������ �.�.'
update ������ set �������=18 where �������=19

-------------------------------------

create table �������
(ID������� int not null identity,
�������� varchar(50) not null default '�� �������',
������������� int not null default 10,
ID�� int not null,
constraint CS_PK3 primary key (ID�������),
constraint CS_FK2 foreign key(ID��) references �����������(ID��) on delete cascade on update cascade,
constraint CS_Check5 check (�������� = '�������' or �������� = '����������' or �������� = '�����������' or �������� = '����������' or �������� = '���������' or �������� = '��������'),
constraint CS_Check6 check (�������������>=10 and �������������<=100))

insert into ������� (��������, �������������, ID��) values ('�������', 24, 4)
insert into ������� (��������, �������������, ID��) values ('����������', 65, 3)
insert into ������� (��������, �������������, ID��) values ('�����������', 42, 1)
insert into ������� (��������, �������������, ID��) values ('����������', 84, 2)
insert into ������� (��������, �������������, ID��) values ('���������', 87, 4)
insert into ������� (��������, �������������, ID��) values ('�����������', 42, 1)
insert into ������� (��������, �������������, ID��) values ('����������', 84, 2)

update ������� set ��������='��������' where ��������='���������'
update ������� set �������������=76 where �������������=42

-------------------------------------

create table ����� 
(ID����� int not null identity,
���������� date not null default '�� �������',
�������������� int not null default 0,
ID������� int not null,
ID������� int not null,
constraint CS_PK4 primary key (ID�����),
constraint CS_FK3 foreign key(ID�������) references ������(ID�������) on delete cascade on update cascade,
constraint CS_FK4 foreign key(ID�������) references �������(ID�������) on delete cascade on update cascade)

insert into ����� (����������, ��������������, ID�������, ID�������) values ('2020-03-20', 8, 235614, 1)
insert into ����� (����������, ��������������, ID�������, ID�������) values ('2019-11-13', 7, 235618, 3)
insert into ����� (����������, ��������������, ID�������, ID�������) values ('2020-02-04', 4, 235614, 4)
insert into ����� (����������, ��������������, ID�������, ID�������) values ('2018-05-30', 8, 235615, 5)
insert into ����� (����������, ��������������, ID�������, ID�������) values ('2020-02-04', 4, 235614, 4)
insert into ����� (����������, ��������������, ID�������, ID�������) values ('2018-05-30', 8, 235615, 5)
insert into ����� (����������, ��������������, ID�������, ID�������) values ('2020-01-26', 10, 235618, 1)

update ����� set ����������='2019-01-01' where ����������='2018-05-30'
update ����� set ID�������=3 where ID�������=5

