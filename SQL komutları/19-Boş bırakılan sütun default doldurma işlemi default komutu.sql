
Create table Persons
(
ID int not null, 
Lastname varchar(255) not null,
Firstname varchar(255),
Age int,
City varchar(255) default 'Istanbul'--Otomatik olarak de�er girilmezse default de�er atma
)

insert into Persons(ID,Lastname,Firstname,Age,City) values (3,'Jon','Can',26,'Adana')

insert into Persons(ID,Lastname,Firstname,Age) values (2,'Jonshon','Cans�n',26)


select * from Persons


