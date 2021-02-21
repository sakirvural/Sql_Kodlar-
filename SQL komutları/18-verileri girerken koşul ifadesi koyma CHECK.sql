create table Ornek4
(
ID int primary key, 
Isim nvarchar(20),
SoyIsim nvarchar(20),
Yas int check(Yas>10)--check ile koþul ifadesi koyma
)

insert into Ornek4(ID,Isim,SoyIsim,Yas) values (1,'Can','Boz',6)

select * from Ornek4