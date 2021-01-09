CREATE DATABASE LAB4_5
USE LAB4_5

CREATE TABLE GENRE(
  IDge INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  CONSTRAINT PK4 PRIMARY KEY (IDge),
);

insert into GENRE ([name]) values ('��������')
insert into GENRE ([name]) values ('�����')
insert into GENRE ([name]) values ('������')
insert into GENRE ([name]) values ('���������')
insert into GENRE ([name]) values ('��������')

update GENRE set [name]='�����' where [name]='������'
update GENRE set [name]='�������' where [name]='�����'


---------------------------------------------


CREATE TABLE Country(
  IDc INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  CONSTRAINT PK5 PRIMARY KEY (IDc),
);

insert into Country ([name]) values ('���������')
insert into Country ([name]) values ('�����������')
insert into Country ([name]) values ('��������')
insert into Country ([name]) values ('����')
insert into Country ([name]) values ('������')

update Country set [name]='�������' where [name]='���������'
update Country set [name]='������' where [name]='������'


-----------------------------------------------

CREATE TABLE Artist(
  IDa INT UNIQUE NOT NULL IDENTITY(1, 1),
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  patronymic VARCHAR(50) NOT NULL,
  IDge INT,
  IDc INT,
  CONSTRAINT PK1 PRIMARY KEY (IDa),
  CONSTRAINT FK1 FOREIGN KEY (IDge) REFERENCES GENRE (IDge) ON DELETE CASCADE,
  CONSTRAINT FK2 FOREIGN KEY (IDc) REFERENCES  Country (IDc) ON DELETE CASCADE,
);

insert into Artist (firstname, lastname, patronymic, IDge, IDc) values ('�������', '������', '����������', 1, 5)
insert into Artist (firstname, lastname, patronymic, IDge, IDc) values ('�����', '�������', '���������', 2, 1)
insert into Artist (firstname, lastname, patronymic, IDge, IDc) values ('�����', '�������', '����������', 3, 2)
insert into Artist (firstname, lastname, patronymic, IDge, IDc) values ('������', '�������', '����������', 5, 4)
insert into Artist (firstname, lastname, patronymic, IDge, IDc) values ('����', '�������', '����������', 1, 5)

update Artist set lastname='�������' where lastname='�������'
update Artist set firstname='�������' where firstname='������'


-----------------------------------------------

CREATE TABLE Artist_Group(
  IDg INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  quantity INT NOT NULL,
  CONSTRAINT PK2 PRIMARY KEY (IDg),
);

insert into Artist_Group ([name], quantity) values ('������', 10)
insert into Artist_Group ([name], quantity) values ('��������', 2)
insert into Artist_Group ([name], quantity) values ('�������', 5)
insert into Artist_Group ([name], quantity) values ('�����', 3)
insert into Artist_Group ([name], quantity) values ('��-2', 9)

update Artist_Group set [name]='The Beatles' where [name]='�������'
update Artist_Group set quantity=4 where quantity=2


-----------------------------------------------

CREATE TABLE Artist_and_Group(
  IDag INT UNIQUE NOT NULL IDENTITY(1, 1),
  IDg INT,
  IDa INT,
  CONSTRAINT PK3 PRIMARY KEY (IDag),
  CONSTRAINT FK3 FOREIGN KEY (IDa) REFERENCES Artist (IDa) ON DELETE CASCADE,
  CONSTRAINT FK4 FOREIGN KEY (IDg) REFERENCES Artist_Group (IDg) ON DELETE CASCADE,
);

insert into Artist_and_Group (IDg, IDa) values (1, 2)
insert into Artist_and_Group (IDg, IDa) values (2, 3)
insert into Artist_and_Group (IDg, IDa) values (3, 4)
insert into Artist_and_Group (IDg, IDa) values (5, 2)
insert into Artist_and_Group (IDg, IDa) values (1, 5)

-----------------------------------------------

CREATE TABLE Genre_Song(
  IDgs INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  CONSTRAINT PK6 PRIMARY KEY (IDgs),
);

insert into Genre_Song ([name]) values ('����������')
insert into Genre_Song ([name]) values ('������')
insert into Genre_Song ([name]) values ('��������')
insert into Genre_Song ([name]) values ('���������')
insert into Genre_Song ([name]) values ('����')

update Genre_Song set [name]='������' where [name]='������'
update Genre_Song set [name]='�������' where [name]='����'


-----------------------------------------------

CREATE TABLE Type_Song(
  IDts INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  CONSTRAINT PK7 PRIMARY KEY (IDts),
);

insert into Type_Song ([name]) values ('������������ �����')
insert into Type_Song ([name]) values ('��������� �����')
insert into Type_Song ([name]) values ('������')
insert into Type_Song ([name]) values ('������')
insert into Type_Song ([name]) values ('�������')

update Type_Song set [name]='����������� �����' where [name]='������'
update Type_Song set [name]='���-������' where [name]='�������'


------------------------------------------------

CREATE TABLE Song(
  IDs INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  number_song INT NOT NULL,
  time_song INT NOT NULL,
  IDa INT,
  IDgs INT,
  IDts INT,
  CONSTRAINT PK8 PRIMARY KEY (IDs),
  CONSTRAINT FK5 FOREIGN KEY (IDa) REFERENCES Artist (IDa) ON DELETE CASCADE,
  CONSTRAINT FK6 FOREIGN KEY (IDgs) REFERENCES Genre_Song (IDgs) ON DELETE CASCADE,
  CONSTRAINT FK7 FOREIGN KEY (IDts) REFERENCES Type_Song (IDts) ON DELETE CASCADE,
);

insert into Song ([name], number_song, time_song, IDa, IDgs, IDts) values ('��������', 2, 2, 2, 1, 2)
insert into Song ([name], number_song, time_song, IDa, IDgs, IDts) values ('�������', 3, 2, 3, 2, 3)
insert into Song ([name], number_song, time_song, IDa, IDgs, IDts) values ('��������', 7, 3, 4, 4, 4)
insert into Song ([name], number_song, time_song, IDa, IDgs, IDts) values ('�����������', 8, 2, 5, 5, 2)
insert into Song ([name], number_song, time_song, IDa, IDgs, IDts) values ('�������', 4, 2, 2, 1, 5)

update Song set [name]='���������' where [name]='�������'
update Song set number_song=5 where number_song=3


------------------------------------------------

CREATE TABLE Type_album(
  IDta INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  CONSTRAINT PK9 PRIMARY KEY (IDta),
);

insert into Type_album ([name]) values ('����-������')
insert into Type_album ([name]) values ('����-���')
insert into Type_album ([name]) values ('�������')
insert into Type_album ([name]) values ('��������� ������')
insert into Type_album ([name]) values ('������� ������')

update Type_album set [name]='��������' where [name]='����-���'
update Type_album set [name]='�����' where [name]='������� ������'


------------------------------------------------

CREATE TABLE Album(
  IDa INT UNIQUE NOT NULL IDENTITY(1, 1),
  [name] VARCHAR(50) NOT NULL,
  [year] INT NOT NULL,
  quantity INT NOT NULL,
  IDta INT,
  CONSTRAINT PK10 PRIMARY KEY (IDa),
  CONSTRAINT FK8 FOREIGN KEY (IDta) REFERENCES Type_album (IDta) ON DELETE CASCADE,
);

insert into Album ([name], [year], quantity, IDta) values ('The Dark Side of the Moon', 2020, 10, 2)
insert into Album ([name], [year], quantity, IDta) values ('Back in Black', 2019, 8, 3)
insert into Album ([name], [year], quantity, IDta) values ('The Bodyguard', 2020, 1, 4)
insert into Album ([name], [year], quantity, IDta) values ('Bat Out of Hell', 2017, 12, 5)
insert into Album ([name], [year], quantity, IDta) values ('������� �����', 2018, 5, 2)

update Album set [name]='Rumours' where [name]='The Dark Side of the Moon'
update Album set [year]=2020 where [year]=2017


------------------------------------------------

CREATE TABLE Record(
  IDr INT UNIQUE NOT NULL IDENTITY(1, 1),
  [year] INT NOT NULL,
  IDs INT,
  IDa INT,
  CONSTRAINT PK11 PRIMARY KEY (IDr),
  CONSTRAINT FK9 FOREIGN KEY (IDs) REFERENCES Song (IDs) ON DELETE CASCADE,
  CONSTRAINT FK10 FOREIGN KEY (IDa) REFERENCES Album (IDa) ON DELETE CASCADE,
);

insert into Record ([year], IDs, IDa) values (2020, 2, 1)
insert into Record ([year], IDs, IDa) values (2018, 3, 2)
insert into Record ([year], IDs, IDa) values (2019, 4, 3)
insert into Record ([year], IDs, IDa) values (2021, 5, 1)
insert into Record ([year], IDs, IDa) values (2017, 2, 5)

update Record set IDs=5 where IDs=3
update Record set [year]=2018 where [year]=2017
