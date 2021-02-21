create table Ornek2
(
ID int Unique,--Ayný ID sahip olamaz
Isim nvarchar(10)
)

insert into Ornek2(ID,Isim)  values (1,'Can')
insert into Ornek2(ID,Isim)  values (2,'Canboz')

select * from Ornek2