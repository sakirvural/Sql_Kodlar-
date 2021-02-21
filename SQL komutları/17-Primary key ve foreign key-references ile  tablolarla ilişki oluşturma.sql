create table Musteri
(
ID int primary key,--di�er tablolarla ili�ki sa�lamak i�in benzersiz anahtar�m�z
Isim nvarchar(20),
Soyisim nvarchar(20),
Yas int
)

create table MusteriIletisim	
(
ID int,
Telefon1 nvarchar(12),
Telefon2 nvarchar(12)
foreign key (ID) references Musteri(ID)--Musteri ID ile birbirine ba�lad�k
)


insert into Musteri(ID,Isim,Soyisim,Yas) values (1,'Can','Boz',26)
insert into Musteri(ID,Isim,Soyisim,Yas) values (2,'Can','Boz',26)

--Musterimizdeki ID ba�l� olarak ileti�im ekledik
insert into MusteriIletisim(ID,Telefon1,Telefon2) values (2,'2122222222','2123333333')

select * from Musteri
select * from MusteriIletisim

delete Musteri where ID=1
delete Musteri where ID=2
delete MusteriIletisim where ID=2