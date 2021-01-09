create database Vova_5
use Vova_5

create table ТипПредмета
(IDтп int not null identity,
Название varchar(50) not null default 'не указано',
constraint CS_PK primary key (IDтп),
constraint CS_Check check (Название = 'Точная наука' or Название = 'Техническая' or Название = 'Общественная' or Название = 'Естественная' or Название = 'Гумонитарная' or Название = 'Физическая'))

insert into ТипПредмета (Название) values ('Точная наука')
insert into ТипПредмета (Название) values ('Техническая')
insert into ТипПредмета (Название) values ('Общественная')
insert into ТипПредмета (Название) values ('Естественная')
insert into ТипПредмета (Название) values ('Гумонитарная')

update ТипПредмета set Название='Физическая' where Название='Гумонитарная'

-------------------------------------

create table Город
(IDгород int not null identity,
Название varchar(50) not null default 'не указано',
constraint CS_PK1 primary key (IDгород))

alter table Город add constraint CS_Check1 check (Название = 'Минск' or Название = 'Гродно' or Название = 'Несвиж' or Название = 'Брест' or Название = 'Гомель' or Название = 'Полоцк' or Название = 'Витебск')

insert into Город (Название) values ('Минск')
insert into Город (Название) values ('Гродно')
insert into Город (Название) values ('Брест')
insert into Город (Название) values ('Гомель')
insert into Город (Название) values ('Полоцк')

update Город set Название='Витебск' where Название='Полоцк'
update Город set Название='Несвиж' where Название='Минск'

-------------------------------------

create table Ученик
(IDпаспорт int not null,
ФИО varchar(50) not null default 'не указано',
Пол varchar(1) not null default 'не указано',
Возраст int not null default 7,
ДатаРождения date not null default '1950-01-01',
IDгород int not null,
constraint CS_PK2 primary key (IDпаспорт),
constraint CS_FK1 foreign key(IDгород) references Город(IDгород) on delete cascade on update cascade,
constraint CS_Check2 check (Пол='м' or Пол='ж'),
constraint CS_Check3 check (Возраст>=7 and Возраст<=30),
constraint CS_Check4 check (ДатаРождения>='1950-01-01' and ДатаРождения<='2020-03-26'))

insert into Ученик values (235614, 'Виноградова А.Л.', 'ж', 16, '2004-04-23', 1)
insert into Ученик values (235615, 'Красильников А.Р.', 'м', 18, '2002-06-30', 3)
insert into Ученик values (235616, 'Быкова С.Ф.', 'ж', 17, '2000-11-01', 3)
insert into Ученик values (235617, 'Юдин П.Н.', 'м', 15, '2005-01-10', 4)
insert into Ученик values (235618, 'Красильников А.Р.', 'м', 18, '2002-06-30', 3)
insert into Ученик values (235619, 'Быкова С.Ф.', 'ж', 17, '2000-11-01', 3)
insert into Ученик values (235620, 'Юдин П.Н.', 'м', 15, '2005-01-10', 4)
insert into Ученик values (235621, 'Лебедева А.А.', 'ж', 19, '2001-08-21', 5)

update Ученик set ФИО='Кулагин Ю.А.' where ФИО='Красильников А.Р.'
update Ученик set Возраст=18 where Возраст=19

-------------------------------------

create table Предмет
(IDпредмет int not null identity,
Название varchar(50) not null default 'не указано',
КоличествоЧас int not null default 10,
IDтп int not null,
constraint CS_PK3 primary key (IDпредмет),
constraint CS_FK2 foreign key(IDтп) references ТипПредмета(IDтп) on delete cascade on update cascade,
constraint CS_Check5 check (Название = 'История' or Название = 'Литература' or Название = 'Физкультура' or Название = 'Математика' or Название = 'География' or Название = 'Биология'),
constraint CS_Check6 check (КоличествоЧас>=10 and КоличествоЧас<=100))

insert into Предмет (Название, КоличествоЧас, IDтп) values ('История', 24, 4)
insert into Предмет (Название, КоличествоЧас, IDтп) values ('Литература', 65, 3)
insert into Предмет (Название, КоличествоЧас, IDтп) values ('Физкультура', 42, 1)
insert into Предмет (Название, КоличествоЧас, IDтп) values ('Математика', 84, 2)
insert into Предмет (Название, КоличествоЧас, IDтп) values ('География', 87, 4)
insert into Предмет (Название, КоличествоЧас, IDтп) values ('Физкультура', 42, 1)
insert into Предмет (Название, КоличествоЧас, IDтп) values ('Математика', 84, 2)

update Предмет set Название='Биология' where Название='География'
update Предмет set КоличествоЧас=76 where КоличествоЧас=42

-------------------------------------

create table Выбор 
(IDвыбор int not null identity,
ДатаВыбора date not null default 'не указано',
ОтметкаОВыборе int not null default 0,
IDпаспорт int not null,
IDпредмет int not null,
constraint CS_PK4 primary key (IDвыбор),
constraint CS_FK3 foreign key(IDпаспорт) references Ученик(IDпаспорт) on delete cascade on update cascade,
constraint CS_FK4 foreign key(IDпредмет) references Предмет(IDпредмет) on delete cascade on update cascade)

insert into Выбор (ДатаВыбора, ОтметкаОВыборе, IDпаспорт, IDпредмет) values ('2020-03-20', 8, 235614, 1)
insert into Выбор (ДатаВыбора, ОтметкаОВыборе, IDпаспорт, IDпредмет) values ('2019-11-13', 7, 235618, 3)
insert into Выбор (ДатаВыбора, ОтметкаОВыборе, IDпаспорт, IDпредмет) values ('2020-02-04', 4, 235614, 4)
insert into Выбор (ДатаВыбора, ОтметкаОВыборе, IDпаспорт, IDпредмет) values ('2018-05-30', 8, 235615, 5)
insert into Выбор (ДатаВыбора, ОтметкаОВыборе, IDпаспорт, IDпредмет) values ('2020-02-04', 4, 235614, 4)
insert into Выбор (ДатаВыбора, ОтметкаОВыборе, IDпаспорт, IDпредмет) values ('2018-05-30', 8, 235615, 5)
insert into Выбор (ДатаВыбора, ОтметкаОВыборе, IDпаспорт, IDпредмет) values ('2020-01-26', 10, 235618, 1)

update Выбор set ДатаВыбора='2019-01-01' where ДатаВыбора='2018-05-30'
update Выбор set IDпредмет=3 where IDпредмет=5

