create database LR6_8
use LR6_8


create table TypeOfingred
(IDT int not null identity,
Nazvanie2 varchar(10) not null,
constraint CS_PK2 primary key(IDT))


create table Ingred
(IDI int not null identity,
Nazvanie varchar(50) not null,
Kolvo int not null,
Cena int not null,
constraint CS_PK0 primary key(IDI),
IDT int not null,
constraint CS_FK2 foreign key(IDT) references TypeOfingred (IDT) on delete cascade on update cascade)


create table TypeOfSandwich
(IDType int not null identity,
Nazvanie varchar(50) not null
constraint CS_PK4 primary key(IDType))


create table Sandwich
(IDSANDWICH int not null identity,
Nazvanie_Sandwicha varchar(50) not null,
Cena int not null,
constraint CS_PK21 primary key(IDSANDWICH),
IDType int not null,
constraint CS_FK4 foreign key(IDType) references TypeOfSandwich(IDType) on delete cascade on update cascade)


create table Prigotovl
(IDP int not null identity,
Kolvo int not null,
constraint CS_PK10 primary key(IDP),
TimePrigo time not null ,
IDI int not null,
constraint CS_FK1 foreign key(IDI) references Ingred(IDI) on delete cascade on update cascade,
IDSANDWICH int not null,
constraint CS_FK15 foreign key(IDSANDWICH) references Sandwich(IDSANDWICH) on delete cascade on update cascade)


create table GOROD
(IDG int not null identity,
Nazvanie varchar(10) not null,
constraint CS_PK primary key(IDG))


create table Office
(IDO int not null identity,
Nazvanie3 varchar(50) not null,
Phone int not null,
IDG int not null,
constraint CS_PK3 primary key(IDO),
constraint CS_FK foreign key(IDG) references GOROD(IDG) on delete cascade on update cascade)


create table ZAKAZ
(IDZ int not null identity,
DataZak date not null default '2020-21-09',
Cena int not null,
Kolvo int not null,
TimeZak time not null default '13:37',
constraint CS_PK7 primary key(IDZ),
IDO int not null,
constraint CS_FK5 foreign key(IDO) references Office(IDO) on delete cascade on update cascade,
IDSANDWICH int not null,
constraint CS_FK90 foreign key(IDSANDWICH) references Sandwich(IDSANDWICH) on delete cascade on update cascade)

alter table Sandwich add constraint CS_CHEK2 check (Nazvanie_Sandwicha='����������' or Nazvanie_Sandwicha='���������' or Nazvanie_Sandwicha='�������' or Nazvanie_Sandwicha='�������' or Nazvanie_Sandwicha='������')


insert into TypeOfingred ( Nazvanie2) values ('������')
insert into TypeOfingred (Nazvanie2) values ('�������')
insert into TypeOfingred ( Nazvanie2) values ('�����')
insert into TypeOfingred ( Nazvanie2) values ('�������')
insert into TypeOfingred ( Nazvanie2) values ('������')

insert into Ingred (IDT, Nazvanie,Kolvo, Cena) values (1,'�������',647, 3)
insert into Ingred (IDT, Nazvanie,Kolvo, Cena) values (2,'���',345, 3)
insert into Ingred (IDT, Nazvanie,Kolvo, Cena) values (3,'�����',228, 15)
insert into Ingred (IDT, Nazvanie,Kolvo, Cena) values (4,'�����',50,4)
insert into Ingred (IDT, Nazvanie,Kolvo, Cena) values (5,'���',68,4)

insert into TypeOfSandwich (Nazvanie)values ('������')
insert into TypeOfSandwich (Nazvanie)values ('������')
insert into TypeOfSandwich (Nazvanie)values ('������')
insert into TypeOfSandwich (Nazvanie)values ('�������������')
insert into TypeOfSandwich (Nazvanie)values ('�������')

insert into Sandwich (IDType, Nazvanie_Sandwicha, Cena) values (1,'����������', 4)
insert into Sandwich (IDType, Nazvanie_Sandwicha, Cena) values (2,'���������', 3)
insert into Sandwich (IDType, Nazvanie_Sandwicha, Cena) values (3,'�������', 2)
insert into Sandwich (IDType, Nazvanie_Sandwicha, Cena) values (4,'�������', 1)
insert into Sandwich (IDType, Nazvanie_Sandwicha, Cena) values (5,'������', 2)

insert into Prigotovl (IDI,IDSANDWICH, TimePrigo, Kolvo) values (6,1, '12:25',200)
insert into Prigotovl (IDI,IDSANDWICH, TimePrigo, Kolvo) values (7,2, '15:25',150)
insert into Prigotovl (IDI,IDSANDWICH, TimePrigo, Kolvo) values (8,3,'16:25',345)
insert into Prigotovl (IDI,IDSANDWICH, TimePrigo, Kolvo) values (9,4, '17:25',25)
insert into Prigotovl (IDI,IDSANDWICH, TimePrigo, Kolvo) values (10,5, '18:25',100)

insert into GOROD (Nazvanie) values ('�����')
insert into GOROD (Nazvanie) values ('������')
insert into GOROD (Nazvanie) values ('�������')
insert into GOROD (Nazvanie) values ('�������')
insert into GOROD (Nazvanie) values ('������')

insert into Office (IDG, Nazvanie3, Phone) values (1,'������ ���������',6476048)
insert into Office (IDG, Nazvanie3, Phone) values (2,'�������',6476045)
insert into Office (IDG, Nazvanie3, Phone) values (3,'����������',3466048)
insert into Office (IDG, Nazvanie3, Phone) values (4,'����������',6476508)
insert into Office (IDG, Nazvanie3, Phone) values (5,'������',6476568)

insert into ZAKAZ(IDO,IDSANDWICH, DataZak,TimeZak, Kolvo, Cena) values (1,1,'21-09-2020', '12:25',200, 500)
insert into ZAKAZ(IDO,IDSANDWICH, DataZak,TimeZak, Kolvo, Cena) values (2,2,'01-05-2020', '16:43',150, 300)
insert into ZAKAZ(IDO,IDSANDWICH, DataZak,TimeZak, Kolvo, Cena) values (3,3,'21-03-2020', '18:11',345, 948)
insert into ZAKAZ(IDO,IDSANDWICH, DataZak,TimeZak, Kolvo, Cena) values (4,4,'11-10-2020', '20:12',25, 31)
insert into ZAKAZ(IDO,IDSANDWICH, DataZak,TimeZak, Kolvo, Cena) values (5,5,'26-12-2020', '13:52',100, 225)


update ZAKAZ set Kolvo = 200 where Kolvo=100
update Ingred set Cena=15 where Cena=7
update GOROD set Nazvanie = '�����' where Nazvanie='������'

delete from ZAKAZ where Kolvo=300
delete from Ingred where Cena=7
delete from GOROD where Nazvanie='�����'

select GOROD.Nazvanie as '�����'
From GOROD

select TypeOfSandwich.Nazvanie as '���� ���������'
From TypeOfSandwich
where TypeOfSandwich.Nazvanie='������' or TypeOfSandwich.Nazvanie='������' or TypeOfSandwich.Nazvanie='�������'
order by TypeOfSandwich.Nazvanie DESC

select  Office.Nazvanie3 as '�������� �����', Office.Phone as '������� �����' 
from Office

select Prigotovl.Kolvo as '���-�� ���������� ���������', Prigotovl.TimePrigo as '����� �� ������� ������ ���� ������������'
From Prigotovl
where Prigotovl.Kolvo > '150' and Prigotovl.TimePrigo <>'17:25'

select TypeOfIngred.Nazvanie2 as '�������� ���. �����������'
from TypeOfIngred
where TypeOfIngred.Nazvanie2 like '�%' or TypeOfIngred.Nazvanie2 like '�%'


select ZAKAZ.DataZak as '���� ������', ZAKAZ.TimeZak as '����� �� ������� ��������', ZAKAZ.Kolvo as '���-�� ���������', ZAKAZ.Cena as '���� ������'
from ZAKAZ
where ZAKAZ.DataZak between '21-09-2020' and '26-12-2020'

select ZAKAZ.DataZak as '���� ������', ZAKAZ.TimeZak as '����� �� ������� ��������', ZAKAZ.Kolvo as '���-�� ���������', ZAKAZ.Cena as '���� ������'
from ZAKAZ
where ZAKAZ.Kolvo between '100' and '345' and ZAKAZ.Cena > '300'

select Sandwich.Cena as '����'
from sandwich
where sandwich.cena>'1'
order by sandwich.cena desc



Select GOROD.Nazvanie,count(*) as '���-�� ������� �� �������'
From GOROD 
group by GOROD.Nazvanie
having COUNT(*)=1	
	
select GOROD.Nazvanie as '�������� ������',Office.Phone as '������� �����',count(*) as '���������� ������� �� ���� ����� � �������� 18 ���'
From GOROD join Office on Office.IDG=GOROD.IDG
group by GOROD.Nazvanie,Office.Phone
having COUNT(*)=2

select ZAKAZ.DataZak,avg(price) as '������� ���� ���� �������'
From ZAKAZ join Sandwich on ZAKAZ.IDSANDWICH=Sandwich.IDSANDWICH
group by ZAKAZ.DataZak,Sandwich.Cena
HAVING AVG(price) <=300


Select Sandwich.Nazvanie_Sandwicha as '�������� �������� ', Sandwich.Cena as '����',TypeOfSandwich.Nazvanie as '��� ��������'
From Sandwich join ZAKAZ on ZAKAZ.IDSANDWICH=Sandwich.IDSANDWICH
           join TypeOfSandwich on TypeOfSandwich.IDType=Sandwich.IDType
		   where Sandwich.Cena <>'3' or Sandwich.Nazvanie_Sandwicha='������'and Sandwich.Nazvanie_Sandwicha='������' 
		   order by ZAKAZ.Kolvo desc

Select ZAKAZ.DataZak as '���� ������', TimeZak as '����� ������',Sandwich.Cena as '����'
From ZAKAZ join Sandwich on ZAKAZ.IDSANDWICH=Sandwich.IDSANDWICH
           where ZAKAZ.DataZak between '21-09-2020' and '26-12-2020'
		 

select Ingred.Nazvanie as '�������� �����������', Ingred.Kolvo as '����������',TypeOfingred.Nazvanie2 as '���'
From Ingred join TypeOfingred on TypeOfingred.IDT=Ingred.IDT
where Ingred.Nazvanie like '�%' and Ingred.Kolvo >'50' 
order by Ingred.Kolvo desc