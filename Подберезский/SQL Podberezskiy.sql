create database hospital1
use hospital1

create table город
(
IDG int not null identity,
gName varchar(50) not null,
constraint  CS_PK primary key(IDG),
)
alter table город add constraint CS_Check1 check(gName = 'Минск' or gName = 'Брест' or gName = 'Гродно' or gName = 'Гомель' or gName = 'Могилёв' or gName = 'Витебск')

insert into город(gName) values ('Брест')
insert into город(gName) values ('Минск')
insert into город(gName) values ('Витебск')
insert into город(gName) values ('Гомель')
insert into город(gName) values ('Гродно')

update город set gName = 'Могилёв' where gName = 'Брест'
update город set gName = 'Брест' where gName = 'Минск'

delete from город where gName ='Могилёв'

create table специальность
(
IDC int not null identity,
cName varchar(50) not null,
constraint CS_PK2 primary key(IDC)
)

insert into специальность(cName) values ('Терапевт')
insert into специальность(cName) values ('Педиатр')
insert into специальность(cName) values ('Кардиолог')
insert into специальность(cName) values ('Гематолог')
insert into специальность(cName) values ('Инфекционист')

update специальность set cName = 'Хирург' where cName = 'Педиатор'
update специальность set cName = 'Генеколог' where cName = 'Гематолог'

delete from специальность where cName ='Кардиолог'

create table врач
(
IDv int not null identity,
vSTAZH int not null,
vVOZRAST int not null,
vFIO varchar(50) not null,
vDataBirthday date not null,
IDG int not null,
IDC int not null,
constraint CS_PK3 primary key(IDv),
constraint CS_FK1 foreign key(IDG) references город(IDG) on delete cascade on update cascade,
constraint CS_FK2 foreign key(IDC) references специальность(IDC) on delete cascade on update cascade,
constraint CS_Check check (vSTAZH >=2)
)
insert into врач(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (3,25,'Иванов Иван Иванович','01.01.1995',1,1)
insert into врач(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (4,28,'Подберезский Максим Иванович','01.01.1992',2,2)
insert into врач(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (5,22,'Белаш Алексей Иванович','01.01.1998',3,3)
insert into врач(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (6,43,'Салата Алексей Иванович','01.01.1977',4,4)
insert into врач(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (7,55,'Табанец Михаил Иванович','01.01.1965',5,5)

update врач set vSTAZH = 4 where vSTAZH = 3
update врач set vSTAZH = 3 where vSTAZH > 5
update врач set vVOZRAST= 20 where vSTAZH = 3

delete from врач where vVOZRAST > 20


create table улица
(
IDS int not null identity,
sName varchar(50) not null,
constraint CS_PK5 primary key (IDS)
)

insert into улица(sName) values ('Янки Маура')
insert into улица(sName) values ('Дунина-Мартинкевича')
insert into улица(sName) values ('Магилёвская')
insert into улица(sName) values ('Матусевича')
insert into улица(sName) values ('Пушкина')

update улица set sName = 'Колесниково' where IDS = 2
update улица set sName = 'Дунина-Мартинкевича' where sName = 'Пушкина' 

delete from улица where sName = 'Магилёвская'


create table пациент
(
pNOMERKARTI int not null identity,
pDATABIRTHDAY date not null,
pVOZROST int not null,
pNOMERTEL varchar(50) not null,
pFIO varchar(50) not null,
IDS int not null,
constraint CS_PK4 primary key(pNOMERKARTI),
constraint CS_FK3 foreign key(IDS) references улица(IDS) on delete cascade on update cascade,
)
 
insert into пациент(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('01.01.2001',19,'+375259496170','Подберезский Максим Дмитриевич',(select IDS from улица where sName = 'Янки Маура'))
insert into пациент(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('02.02.2008',12,'+375259496170','Белаш Алексей Сергеевич',(select IDS from улица where sName = 'Дунина-Мартинкевича'))
insert into пациент(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('03.03.2006',14,'+375259496170','Салата Алексей Сергеевич',(select IDS from улица where sName = 'Магилёвская'))
insert into пациент(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('04.04.2004',16,'+375259496170','Табанец Михаил Сергеевич',(select IDS from улица where sName = 'Матусевича'))
insert into пациент(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('05.05.2002',18,'+375259496170','Иванов Иван Сергеевич',(select IDS from улица where sName = 'Пушкина'))
 
update пациент set IDS = 6 where IDS = 1
update пациент set pVOZROST = 16 where IDS = 6

delete from пациент where pVOZROST > 15

create table талон
(
tNOMER int not null identity,
tVREMY date not null,
tDATA date not null,
tSROK varchar(50) not null default'3',
IDv int not null,
pNOMERKARTI int not null,
constraint CS_PK6 primary key(tNOMER),
constraint CS_FK4 foreign key(IDv) references врач(IDv) on delete cascade on update cascade,
constraint CS_FK5 foreign key(pNOMERKARTI) references пациент(pNOMERKARTI) on delete cascade on update cascade
)
insert into талон(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:25:59','23.05.2020','3 дня',1,1)
insert into талон(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:30:59','23.05.2020','2 дня',2,2)
insert into талон(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:35:59','23.05.2020','3 дня',3,3)
insert into талон(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:40:59','23.05.2020','3 дня',4,4)
insert into талон(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:45:59','23.05.2020','1 день',5,5)

update талон set tSROK = '1 час' where tSROK = '2 дня'
update талон set tSROK = '30 минут' where tSROK = '1 день'
delete from талон where tSROK = '3 дня'
drop table город
drop table специальность
drop table врач
drop table улица
drop table пациент
drop table талон