create database NewBD
use NewBD

---------------------------------------------------

create table TipSkacheck
(IDTS int not null identity,
sName varchar(50) not null default 'не указано',
constraint CS_PK primary key (IDTS))

alter table TipSkacheck add constraint CS_Check check (sName = 'Гладкие скачки' or sName = 'Скачки с препятствием' or sName = 'Скачки в упряжке' or sName = 'Скачки барьерные'  or sName = 'Скачки на дистанцию' or sName = 'Скачки по породе')

insert into TipSkacheck (sName) values ('Гладкие скачки')
insert into TipSkacheck (sName) values ('Скачки с препятствием')
insert into TipSkacheck (sName) values ('Скачки в упряжке')
insert into TipSkacheck (sName) values ('Скачки барьерные')
insert into TipSkacheck (sName) values ('Скачки на дистанцию')

update TipSkacheck set sName='Скачки по породе' where sName='Гладкие скачки'

---------------------------------------------------

create table Poroda
(IDPRD int not null identity,
pName varchar(50) not null default 'не указано',
constraint CS_PK1 primary key(IDPRD))

insert into Poroda (pName) values ('Арабская')
insert into Poroda (pName) values ('Американская')
insert into Poroda (pName) values ('Мустанг')
insert into Poroda (pName) values ('Першерон')
insert into Poroda (pName) values ('Аппалуза')

update Poroda set pName='Морган' where pName='Арабская'
update Poroda set pName='Барабансон' where pName='Першерон'

---------------------------------------------------

create table Skachki
(IDSKCH int not null identity,
sData date not null default '2020-01-01',
sName varchar(50) not null default 'не указано',
IDTS int not null default 0,
constraint CS_PK2 primary key(IDSKCH),
constraint CS_FK foreign key(IDTS) references TipSkacheck(IDTS) on delete cascade on update cascade)

insert into Skachki (sData, sName, IDTS) values ('2020-01-04', 'Кентуккское дерби', 3)
insert into Skachki (sData, sName, IDTS) values ('2020-02-21', 'Кубок Мельбурна', 1)
insert into Skachki (sData, sName, IDTS) values ('2020-03-04', 'Королевский Аскот', 3)
insert into Skachki (sData, sName, IDTS) values ('2020-01-17', 'Кубок мира', 5)
insert into Skachki (sData, sName, IDTS) values ('2020-02-10', 'Кубок Японии', 2)

update Skachki set sName='Кубок Японии' where sName='Кубок Мельбурна'
update Skachki set sName='Кубок РБ' where sName='Кубок мира'

---------------------------------------------------

create table Loshad
(IDLoshad int not null identity,
LName varchar(50) not null default 'не указано',
LMassa int not null default 380,
LSkor int not null default 88,
LDlina int not null default 1,
LRost int not null default 1,
IDPRD int not null default 0,
constraint CS_PK3 primary key(IDLoshad),
constraint CS_FK1 foreign key(IDPRD) references Poroda(IDPRD) on delete cascade on update cascade)

insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Вавилон', 542, 88, 2, 1, 1)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Агат', 456, 89, 2, 1, 3)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Спирит', 385, 90, 2, 1, 2)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Рубин', 634, 89, 2, 1, 4)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Гром', 385, 88, 2, 1, 5)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Спирит', 385, 90, 2, 1, 2)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Рубин', 634, 89, 2, 1, 4)
insert into Loshad (LName, LMassa, LSkor, LDlina, LRost, IDPRD) values ('Гром', 385, 88, 2, 1, 5)

update Loshad set LName='Вегас' where LName='Вавилон'
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

insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 2, 'Первое место', 1, 2)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 3, 'Второе место', 3, 4)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 3, 'Первое место', 5, 2)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 2, 'Четвертое место', 2, 5)
insert into Zabeg (zDlina, zRezultat, IDLoshad, IDSKCH) values ( 3, 'Второе место', 4, 2)

update Zabeg set zRezultat='Второе место' where zRezultat='Первое место'
update Zabeg set IDLoshad=5 where IDLoshad=1

---------------------------------------------------

create table Naeznik
(IDNaeznik int not null identity,
nFIO varchar(50) not null default 'не указано',
nVes int not null default 50,
nVozrast int not null default 18,
nRost int not null default 1,
constraint CS_PK5 primary key(IDNaeznik),
constraint CS_Check2 check (nRost=1 or nRost = 2),
constraint CS_Check3 check (nVes>=50 and nVes<=100))

insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('Мозоль А.А', 55, 23, 2)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('Выставкин А.А', 58, 22, 1)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('Мозоль А.А', 55, 23, 2)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('Выставкин А.А', 58, 22, 1)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('Хоритонов А.А', 60, 25, 2)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('Белаш А.А', 64, 30, 1)
insert into Naeznik (nFIO, nVes, nVozrast, nRost) values ('Букаткин А.А', 51, 21, 2)

update Naeznik set nFIO='Мозоль А.В' where nFIO='Мозоль А.А'
update Naeznik set nFIO='Хоритонов В.В' where nFIO='Хоритонов А.А'

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