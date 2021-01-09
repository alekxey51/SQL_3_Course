create database hospital1
use hospital1

create table �����
(
IDG int not null identity,
gName varchar(50) not null,
constraint  CS_PK primary key(IDG),
)
alter table ����� add constraint CS_Check1 check(gName = '�����' or gName = '�����' or gName = '������' or gName = '������' or gName = '������' or gName = '�������')

insert into �����(gName) values ('�����')
insert into �����(gName) values ('�����')
insert into �����(gName) values ('�������')
insert into �����(gName) values ('������')
insert into �����(gName) values ('������')

update ����� set gName = '������' where gName = '�����'
update ����� set gName = '�����' where gName = '�����'

delete from ����� where gName ='������'

create table �������������
(
IDC int not null identity,
cName varchar(50) not null,
constraint CS_PK2 primary key(IDC)
)

insert into �������������(cName) values ('��������')
insert into �������������(cName) values ('�������')
insert into �������������(cName) values ('���������')
insert into �������������(cName) values ('���������')
insert into �������������(cName) values ('������������')

update ������������� set cName = '������' where cName = '��������'
update ������������� set cName = '���������' where cName = '���������'

delete from ������������� where cName ='���������'

create table ����
(
IDv int not null identity,
vSTAZH int not null,
vVOZRAST int not null,
vFIO varchar(50) not null,
vDataBirthday date not null,
IDG int not null,
IDC int not null,
constraint CS_PK3 primary key(IDv),
constraint CS_FK1 foreign key(IDG) references �����(IDG) on delete cascade on update cascade,
constraint CS_FK2 foreign key(IDC) references �������������(IDC) on delete cascade on update cascade,
constraint CS_Check check (vSTAZH >=2)
)
insert into ����(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (3,25,'������ ���� ��������','01.01.1995',1,1)
insert into ����(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (4,28,'������������ ������ ��������','01.01.1992',2,2)
insert into ����(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (5,22,'����� ������� ��������','01.01.1998',3,3)
insert into ����(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (6,43,'������ ������� ��������','01.01.1977',4,4)
insert into ����(vSTAZH,vVOZRAST,vFIO,vDataBirthday,IDG,IDC) values (7,55,'������� ������ ��������','01.01.1965',5,5)

update ���� set vSTAZH = 4 where vSTAZH = 3
update ���� set vSTAZH = 3 where vSTAZH > 5
update ���� set vVOZRAST= 20 where vSTAZH = 3

delete from ���� where vVOZRAST > 20


create table �����
(
IDS int not null identity,
sName varchar(50) not null,
constraint CS_PK5 primary key (IDS)
)

insert into �����(sName) values ('���� �����')
insert into �����(sName) values ('������-������������')
insert into �����(sName) values ('����������')
insert into �����(sName) values ('����������')
insert into �����(sName) values ('�������')

update ����� set sName = '�����������' where IDS = 2
update ����� set sName = '������-������������' where sName = '�������' 

delete from ����� where sName = '����������'


create table �������
(
pNOMERKARTI int not null identity,
pDATABIRTHDAY date not null,
pVOZROST int not null,
pNOMERTEL varchar(50) not null,
pFIO varchar(50) not null,
IDS int not null,
constraint CS_PK4 primary key(pNOMERKARTI),
constraint CS_FK3 foreign key(IDS) references �����(IDS) on delete cascade on update cascade,
)
 
insert into �������(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('01.01.2001',19,'+375259496170','������������ ������ ����������',(select IDS from ����� where sName = '���� �����'))
insert into �������(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('02.02.2008',12,'+375259496170','����� ������� ���������',(select IDS from ����� where sName = '������-������������'))
insert into �������(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('03.03.2006',14,'+375259496170','������ ������� ���������',(select IDS from ����� where sName = '����������'))
insert into �������(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('04.04.2004',16,'+375259496170','������� ������ ���������',(select IDS from ����� where sName = '����������'))
insert into �������(pDATABIRTHDAY,pVOZROST,pNOMERTEL,pFIO,IDS) values ('05.05.2002',18,'+375259496170','������ ���� ���������',(select IDS from ����� where sName = '�������'))
 
update ������� set IDS = 6 where IDS = 1
update ������� set pVOZROST = 16 where IDS = 6

delete from ������� where pVOZROST > 15

create table �����
(
tNOMER int not null identity,
tVREMY date not null,
tDATA date not null,
tSROK varchar(50) not null default'3',
IDv int not null,
pNOMERKARTI int not null,
constraint CS_PK6 primary key(tNOMER),
constraint CS_FK4 foreign key(IDv) references ����(IDv) on delete cascade on update cascade,
constraint CS_FK5 foreign key(pNOMERKARTI) references �������(pNOMERKARTI) on delete cascade on update cascade
)
insert into �����(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:25:59','23.05.2020','3 ���',1,1)
insert into �����(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:30:59','23.05.2020','2 ���',2,2)
insert into �����(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:35:59','23.05.2020','3 ���',3,3)
insert into �����(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:40:59','23.05.2020','3 ���',4,4)
insert into �����(tVREMY,tDATA,tSROK,IDv,pNOMERKARTI) values('17:45:59','23.05.2020','1 ����',5,5)

update ����� set tSROK = '1 ���' where tSROK = '2 ���'
update ����� set tSROK = '30 �����' where tSROK = '1 ����'
delete from ����� where tSROK = '3 ���'
drop table �����
drop table �������������
drop table ����
drop table �����
drop table �������
drop table �����