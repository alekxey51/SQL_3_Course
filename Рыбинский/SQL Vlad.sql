create database VladBD
use VladBD

create table Специальность
(IDспец int not null identity,
Название varchar(50) not null default 'не указано',
constraint CS_PK primary key (IDспец))
alter table Специальность add constraint CS_Check check (Название = 'Архитектор' or Название = 'Врач' or Название = 'Дизайнер' or Название = 'Экономист'  or Название = 'Инженер-технолог' or Название = 'Журналист')

insert into Специальность (Название) values ('Архитектор')
insert into Специальность (Название) values ('Врач')
insert into Специальность (Название) values ('Дизайнер')
insert into Специальность (Название) values ('Экономист')
insert into Специальность (Название) values ('Инженер-технолог')

update Специальность set Название='Журналист' where Название='Инженер-технолог'

------

create table Город
(IDгород int not null identity,
Название varchar(50) not null default 'не указано',
constraint CS_PK1 primary key (IDгород),
constraint CS_Check1 check (Название = 'Минск' or Название = 'Гродно' or Название = 'Несвиж' or Название = 'Брест' or Название = 'Гомель' or Название = 'Полоцк' or Название = 'Витебск'))

insert into Город (Название) values ('Минск')
insert into Город (Название) values ('Гродно')
insert into Город (Название) values ('Несвиж')
insert into Город (Название) values ('Брест')
insert into Город (Название) values ('Гомель')

update Город set Название='Полоцк' where Название='Брест'
update Город set Название='Витебск' where Название='Несвиж'

-------

create table Студент
(IDстудент int not null identity,
[Имя студента] varchar(50) not null default 'не указано',
Пол char not null,
[Год Рождения] int not null,
Курс int not null default 0,
IDспец int not null default 0,
IDгород int not null default 0,
constraint CS_Check2 check (Пол='м' or Пол='ж'),
constraint CS_Check3 check (Курс>=0 and Курс<=5),
constraint CS_Check4 check ([Год Рождения]>=1900 and [Год Рождения]<=2020),
constraint CS_PK2 primary key (IDстудент),
constraint CS_FK foreign key(IDспец) references Специальность(IDспец) on delete cascade on update cascade,
constraint CS_FK1 foreign key(IDгород) references Город(IDгород) on delete cascade on update cascade)

insert into Студент ([Имя студента], Пол, [Год Рождения], Курс, IDспец, IDгород) values ('Иван', 'м', 2015, 2, 1, 2)
insert into Студент ([Имя студента], Пол, [Год Рождения], Курс, IDспец, IDгород)  values ('Ирина', 'ж', 2010, 4, 3, 3)
insert into Студент ([Имя студента], Пол, [Год Рождения], Курс, IDспец, IDгород)  values ('Николай', 'м', 2003, 5, 4, 4)
insert into Студент ([Имя студента], Пол, [Год Рождения], Курс, IDспец, IDгород)  values ('Василиса', 'ж', 2007, 3, 5, 2)
insert into Студент ([Имя студента], Пол, [Год Рождения], Курс, IDспец, IDгород)  values ('Владислав', 'м', 2015, 1, 1, 5)

update Студент set [Имя студента]='Руслан' where [Имя студента]='Иван'
update Студент set [Год Рождения]=2005 where [Год Рождения]=2007
update Студент set Курс=2 where Курс=1

-------

create table Преподователь
(IDпрепод int not null identity,
ФИО varchar(50) not null default 'не указано',
[Дата Рождения] date not null,
constraint CS_Check5 check ([Дата Рождения] >='1900-01-01' and [Дата Рождения] <='2020-04-16'),
constraint CS_PK3 primary key (IDпрепод))

insert into Преподователь (ФИО, [Дата Рождения]) values ('Фадеев Панкрат Платонович', '1999-04-16')
insert into Преподователь (ФИО, [Дата Рождения]) values ('Колесников Ермолай Донатович', '1990-01-20')
insert into Преподователь (ФИО, [Дата Рождения]) values ('Кириллов Лев Дамирович', '1995-08-20')
insert into Преподователь (ФИО, [Дата Рождения]) values ('Агафонов Матвей Максович', '1990-11-21')
insert into Преподователь (ФИО, [Дата Рождения]) values ('Егоров Игнат Фролович', '1975-03-01')

update Преподователь set ФИО='Медведев Семен Ефимович' where ФИО='Кириллов Лев Дамирович'
update Преподователь set [Дата Рождения]='1990-10-19' where [Дата Рождения]='1990-11-21'

------

create table ТипПредмета
(IDтип int not null identity,
Название varchar(50) not null default 'не указано',
constraint CS_PK4 primary key (IDтип))

insert into ТипПредмета (Название) values ('Общественная')
insert into ТипПредмета (Название) values ('Естественная')
insert into ТипПредмета (Название) values ('Точная наука')
insert into ТипПредмета (Название) values ('Гумонитарная')
insert into ТипПредмета (Название) values ('Техническая')

update ТипПредмета set Название='Физическая' where Название='Гумонитарная'

------

create table Предметы
(IDпредмет int not null identity,
Название varchar(50) not null default 'не указано',
Описание varchar(200) not null,
IDпрепод int not null default 0,
IDтип int not null default 0,
constraint CS_PK5 primary key (IDпредмет),
constraint CS_FK2 foreign key(IDпрепод) references Преподователь(IDпрепод) on delete cascade on update cascade,
constraint CS_FK3 foreign key(IDтип) references ТипПредмета(IDтип) on delete cascade on update cascade)

insert into Предметы (Название, Описание, IDпрепод, IDтип) values ('История', 'область знаний, а также гуманитарная наука, занимающаяся изучением человека в прошлом.', 1, 2)
insert into Предметы (Название, Описание, IDпрепод, IDтип) values ('Литература', 'в широком смысле слова совокупность любых письменных текстов', 2, 5)
insert into Предметы (Название, Описание, IDпрепод, IDтип) values ('Физкультура', 'область социальной деятельности, направленная на сохранение и укрепление здоровья, ', 3, 4)
insert into Предметы (Название, Описание, IDпрепод, IDтип) values ('Математика', 'наука об отношениях между объектами, о которых ничего не известно', 4, 3)
insert into Предметы (Название, Описание, IDпрепод, IDтип) values ('География', 'комп­лекс естественных и об­ще­ст­вен­ных на­ук, изу­чаю­щих струк­ту­ру,', 1, 2)

update Предметы set Название='Биология' where Название='История'
update Предметы set Описание='наука о живых существах и их взаимодействии со средой обитания.' where Описание='область знаний, а также гуманитарная наука, занимающаяся изучением человека в прошлом.'

-------

create table ФормаИтоговойАтестации
(IDформы int not null identity,
Название varchar(50) not null default 'не указано',
constraint CS_PK6 primary key (IDформы))

insert into ФормаИтоговойАтестации (Название) values ('-----')
insert into ФормаИтоговойАтестации (Название) values ('*****')
insert into ФормаИтоговойАтестации (Название) values ('/////')
insert into ФормаИтоговойАтестации (Название) values ('|||||')
insert into ФормаИтоговойАтестации (Название) values ('\\\\\')

-------

create table Экзамен
(IDэкзамен int not null identity,
Результат int not null,
Дата date not null,
IDстудент int not null default 0,
IDпредмет int not null default 0,
IDформы int not null default 0,
constraint CS_Check6 check (Дата >='2020-01-01' and Дата <='2020-04-16'),
constraint CS_PK7 primary key (IDэкзамен),
constraint CS_FK4 foreign key(IDстудент) references Студент(IDстудент) on delete cascade on update cascade,
constraint CS_FK5 foreign key(IDпредмет) references Предметы(IDпредмет) on delete cascade on update cascade,
constraint CS_FK6 foreign key(IDформы) references ФормаИтоговойАтестации(IDформы) on delete cascade on update cascade)

insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 5, '2020-02-09', 1, 1, 1)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 8, '2020-03-29', 2, 3, 2)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 9, '2020-02-11', 3, 4, 3)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 4, '2020-01-26', 3, 5, 4)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 2, '2020-02-10', 1, 1, 5)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 6, '2020-02-09', 1, 1, 1)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 4, '2020-03-29', 2, 3, 2)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 10, '2020-02-11', 3, 4, 3)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 3, '2020-01-26', 3, 5, 4)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 8, '2020-02-10', 1, 1, 5)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 9, '2020-02-09', 1, 1, 1)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 1, '2020-03-29', 2, 3, 2)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 6, '2020-02-11', 3, 4, 3)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 1, '2020-01-26', 3, 5, 4)
insert into Экзамен (Результат, Дата, IDстудент, IDпредмет, IDформы) values ( 2, '2020-02-10', 1, 1, 5)

update Экзамен set Результат=10 where Результат=5
update Экзамен set Дата='2020-01-02' where Дата='2020-02-09'


--SELECT        TOP (100) PERCENT dbo.Студент.[Имя студента], dbo.Студент.Пол, dbo.Студент.[Год Рождения], dbo.Студент.Курс, dbo.Город.Название AS [Название города], dbo.Специальность.Название AS Специальность, 
--                         dbo.ФормаИтоговойАтестации.Название AS [Форма итоговой атизтации], dbo.Предметы.Название AS Предмет, dbo.Предметы.Описание, dbo.ТипПредмета.Название AS [Тип предмета], dbo.Преподователь.ФИО, 
--                         dbo.Преподователь.[Дата Рождения], dbo.Экзамен.Результат, dbo.Экзамен.Дата
--FROM            dbo.ТипПредмета INNER JOIN
--                         dbo.Преподователь INNER JOIN
--                         dbo.Предметы ON dbo.Преподователь.IDпрепод = dbo.Предметы.IDпрепод ON dbo.ТипПредмета.IDтип = dbo.Предметы.IDтип INNER JOIN
--                         dbo.Экзамен ON dbo.Предметы.IDпредмет = dbo.Экзамен.IDпредмет INNER JOIN
--                         dbo.Студент INNER JOIN
--                         dbo.Город ON dbo.Студент.IDгород = dbo.Город.IDгород INNER JOIN
--                         dbo.Специальность ON dbo.Студент.IDспец = dbo.Специальность.IDспец ON dbo.Экзамен.IDстудент = dbo.Студент.IDстудент INNER JOIN
--                         dbo.ФормаИтоговойАтестации ON dbo.Экзамен.IDформы = dbo.ФормаИтоговойАтестации.IDформы
--WHERE        (dbo.Студент.Пол = 'м')
--ORDER BY dbo.Студент.[Имя студента], Предмет DESC
