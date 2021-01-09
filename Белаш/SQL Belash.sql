create database zakaz
use zakaz

create table �����
(
IDM int not null identity,
�Name varchar(50) not null,
constraint  CS_PK primary key(IDM),
)
alter table ����� add constraint CS_Check1 check(�Name = '����������' or �Name = '������' or �Name = '����' or �Name = '����' or �Name = '����' or �Name = '�������' or �Name = '���������')

insert into �����(�Name) values ('����������')
insert into �����(�Name) values ('������')
insert into �����(�Name) values ('����')
insert into �����(�Name) values ('����')
insert into �����(�Name) values ('����')

update ����� set �Name = '���������' where �Name = '����'
update ����� set �Name = '�������' where �Name = '������'

delete from ����� where �Name ='����'

create table �����
(
IDY int not null identity,
yName varchar(50) not null,
constraint CS_PK2 primary key(IDY)
)

insert into �����(yName) values ('�����������')
insert into �����(yName) values ('���������')
insert into �����(yName) values ('������')
insert into �����(yName) values ('����������')
insert into �����(yName) values ('�����������')

update ����� set yName = '������� ������' where yName = '������'
update ����� set yName = '�������' where yName = '���������'

delete from ����� where yName ='������� ������'

create table ���������� 
(
Vin bigint not null identity(23652736457236,5),
acost int not null default 1000,
dveri int not null default 4,
mesta int not null default 5,
IDM int not null,
constraint CS_PK3 primary key(Vin),
constraint CS_FK foreign key(IDM) references  �����(IDM) on delete cascade on update cascade,
constraint CS_Check check (mesta>=2 and mesta<=10)
)
insert into ����������(acost,dveri,mesta,IDM) values (300,4,5,2)
insert into ����������(acost,dveri,mesta,IDM) values (230,2,2,1)
insert into ����������(acost,dveri,mesta,IDM) values (1005,4,5,3)
insert into ����������(acost,dveri,mesta,IDM) values (560,2,3,5)
insert into ����������(acost,dveri,mesta,IDM) values (670,4,6,3)

update ���������� set acost = 450 where acost = 300
update ���������� set acost = 467 where acost = 1005
update ���������� set dveri = 10 where acost < 1000 and acost > 300 

delete from ���������� where acost = 230


create table ������
(
idkl int not null identity,
FIO varchar(50) not null,
number_of_house int not null,
number_of_flat int not null,
DateOfBirth date not null default '2001-02-05',
klAge int not null default 18,
PhoneNumber bigint null,
IDY int not null,
constraint CS_PK5 primary key (idkl),
constraint CS_FK1 foreign key(IDY) references �����(IDY) on delete cascade on update cascade,
constraint CS_Unique unique (FIO),
constraint CS_Unique1 unique (PhoneNumber)
)
 
insert into ������(FIO,number_of_house,number_of_flat,DateOfBirth,klAge,PhoneNumber,IDY) values ('�.�.�.',4,106,'2001-05-02',18,375296928455,1)
insert into ������(FIO,number_of_house,number_of_flat,DateOfBirth,klAge,PhoneNumber,IDY) values ('�.�.�.',16,15,'2002-08-22',17,375296948455,3)
insert into ������(FIO,number_of_house,number_of_flat,DateOfBirth,klAge,PhoneNumber,IDY) values ('�.�.�.',12,176,'2001-12-04',18,375296987634,4)
insert into ������(FIO,number_of_house,number_of_flat,DateOfBirth,klAge,PhoneNumber,IDY) values ('�.�.�.',14,17,'2002-10-27',17,375295643455,2)
insert into ������(FIO,number_of_house,number_of_flat,DateOfBirth,klAge,PhoneNumber,IDY) values ('�.�.�.',15,1,'2001-12-26',18,375296978634,5)

update ������ set number_of_house = 16 where number_of_house = 4
update ������ set number_of_house = 46 where number_of_house = 12

delete from ������ where number_of_flat = 106


create table �����
(
IDZ int not null identity,
zOplata bit not null,
DateVidach date not null default '2019-10-15',
DateBack date not null default '2020-03-26' ,
srok int not null,
zcost int not null default 1000,
Vin bigint not null,
idkl int not null,
constraint CS_PK4 primary key(IDZ),
constraint CS_FK2 foreign key(Vin) references ����������(Vin) on delete cascade on update cascade,
constraint CS_FK3 foreign key(idkl) references ������(idkl)on delete cascade on update cascade
)
insert into ����� (zOplata,DateVidach,DateBack,srok,zcost,Vin,idkl) values ('true','2019-10-15','2020-03-05',109,506,23652736457236,1)
insert into ����� (zOplata,DateVidach,DateBack,srok,zcost,Vin,idkl) values ('false','2019-12-10','2020-01-14',76,405,23652736457241,2)
insert into ����� (zOplata,DateVidach,DateBack,srok,zcost,Vin,idkl) values ('true','2019-06-05','2020-02-10',45,345,23652736457246,4)
insert into ����� (zOplata,DateVidach,DateBack,srok,zcost,Vin,idkl) values ('false','2019-10-27','2020-01-12',876,506,23652736457251,3)
insert into ����� (zOplata,DateVidach,DateBack,srok,zcost,Vin,idkl) values ('true','2019-10-15','2020-01-15',456,506,23652736457256,5)

update ����� set srok = 567 where srok = 876
update ����� set srok = 573 where srok = 456

delete from ����� where zcost = 345