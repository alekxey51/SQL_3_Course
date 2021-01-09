create database NewBD
use NewBD

---------------------------------------------------

create table TipSkacheck
(IDTS int not null identity,
sName varchar(50) not null default '�� �������',
constraint CS_PK primary key (IDTS))

alter table TipSkacheck add constraint CS_Check check (sName = '������� ������' or sName = '������ � ������������' or sName = '������ � �������' or sName = '������ ���������'  or sName = '������ �� ���������' or sName = '������ �� ������')

insert into TipSkacheck (sName) values ('������� ������')
insert into TipSkacheck (sName) values ('������ � ������������')
insert into TipSkacheck (sName) values ('������ � �������')
insert into TipSkacheck (sName) values ('������ ���������')
insert into TipSkacheck (sName) values ('������ �� ���������')

update TipSkacheck set sName='������ �� ������' where sName='������� ������'

---------------------------------------------------

create table Poroda
(IDPRD int not null identity,
pName varchar(50) not null default '�� �������',
constraint CS_PK1 primary key(IDPRD))

insert into Poroda (pName) values ('��������')
insert into Poroda (pName) values ('������������')
insert into Poroda (pName) values ('�������')
insert into Poroda (pName) values ('��������')
insert into Poroda (pName) values ('��������')

update Poroda set pName='������' where pName='��������'
update Poroda set pName='����������' where pName='��������'

---------------------------------------------------

create table Skachki
(IDSKCH int not null identity,
sData date not null default '2020-01-01',
sName varchar(50) not null default '�� �������',
IDTS int not null default 0,
constraint CS_PK2 primary key(IDSKCH),
constraint CS_FK foreign key(IDTS) references TipSkacheck(IDTS) on delete cascade on update cascade)

insert into Skachki (sData, sName, IDTS) values ('2020-01-04', '����������� �����', 3)
insert into Skachki (sData, sName, IDTS) values ('2020-02-21', '����� ���������', 1)
insert into Skachki (sData, sName, IDTS) values ('2020-03-04', '����������� �����', 3)
insert into Skachki (sData, sName, IDTS) values ('2020-01-17', '����� ����', 5)
insert into Skachki (sData, sName, IDTS) values ('2020-02-10', '����� ������', 2)

update Skachki set sName='����� ������' where sName='����� ���������'
update Skachki set sName='����� ��' where sName='����� ����'

---------------------------------------------------

create table Loshad
(IDLoshad int not null identity,
LName varchar(50) not null default '�� �������',
LMassa int not null default 380,
LSkor int not null default 88,
LDlina int not null default 1,
LRost int not null default 1,
IDPRD int not null default 0,
constraint CS_PK3 primary key(IDLoshad),
constraint CS_FK1 foreign key(IDPRD) references Poroda(IDPRD) on delete cascade on update cascade)

insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('�������', 542, 88, 2, 1, 1)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('����', 456, 89, 2, 1, 3)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('������', 385, 90, 2, 1, 2)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('�����', 634, 89, 2, 1, 4)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('����', 385, 88, 2, 1, 5)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('������', 385, 90, 2, 1, 2)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('�����', 634, 89, 2, 1, 4)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('����', 385, 88, 2, 1, 5)

update Loshad set LName='�����' where LName='�������'
update Loshad set LSkor=105 where LSkor=90

---------------------------------------------------

create table Zabeg
(IDZabeg int not null identity,
zDlina int not null default 2,
zRezultat varchar(50) not null,
IDLoshad int not null default 0,
IDSKCH int not null default 0,
constraint CS_PK4 primary key(IDZabeg),
constraint CS_FK2 foreign key(IDLoshad) references Loshad(IDLoshad) on delete cascade on update cascade,
constraint CS_FK3 foreign key(IDSKCH) references Skachki(IDSKCH) on delete cascade on update cascade,
constraint CS_Check1 check (zDlina>=2 or zDlina<=3))

insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 2, '������ �����', 1, 2)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 3, '������ �����', 3, 4)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 3, '������ �����', 5, 2)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 2, '��������� �����', 2, 5)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 3, '������ �����', 4, 2)

update Zabeg set zRezultat='������ �����' where zRezultat='������ �����'
update Zabeg set IDLoshad=5 where IDLoshad=1

---------------------------------------------------

create table Naeznik
(IDNaeznik int not null identity,
nFIO varchar(50) not null default '�� �������',
nVes int not null default 50,
nVozrast int not null default 18,
nRost int not null default 1,
constraint CS_PK5 primary key(IDNaeznik),
constraint CS_Check2 check (nRost=1 or nRost = 2),
constraint CS_Check3 check (nVes>=50 and nVes<=100))

insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('������ �.�', 55, 23, 2)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('��������� �.�', 58, 22, 1)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('������ �.�', 55, 23, 2)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('��������� �.�', 58, 22, 1)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('��������� �.�', 60, 25, 2)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('����� �.�', 64, 30, 1)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('�������� �.�', 51, 21, 2)

update Naeznik set nFIO='������ �.�' where nFIO='������ �.�'
update Naeznik set nFIO='��������� �.�' where nFIO='��������� �.�'

---------------------------------------------------

create table Sostav
(IDSostav int not null identity,
sYear int not null default 2020,
IDLoshad int not null default 0,
IDNaeznik int not null default 0,
constraint CS_PK6 primary key(IDSostav),
constraint CS_FK4 foreign key(IDLoshad) references Loshad(IDLoshad) on delete cascade on update cascade,
constraint CS_FK5 foreign key(IDNaeznik) references Naeznik(IDNaeznik) on delete cascade on update cascade,
constraint CS_Check4 check (sYear>=2001 and sYear <= 2025))

insert into Sostav (sYear, IDLoshad, IDNaeznik) values ( 2020, 1, 3)
insert into Sostav (sYear, IDLoshad, IDNaeznik) values ( 2019, 3, 2)
insert into Sostav (sYear, IDLoshad, IDNaeznik) values ( 2018, 2, 1)
insert into Sostav (sYear, IDLoshad, IDNaeznik) values ( 2017, 4, 4)
insert into Sostav (sYear, IDLoshad, IDNaeznik) values ( 2016, 5, 5)

update Sostav set sYear=2020 where sYear=2016
update Sostav set IDLoshad=1 where IDLoshad=3