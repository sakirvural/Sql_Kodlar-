--HANG� DATABASE �ZER�NDEN ��LEM YAPICA�IMI BEL�RTME 
use SQLFULL
GO
--TABLO OLU�TURMA
create table Personel
(
PersonelID int ,
Isim nvarchar(40),
Soyisim nvarchar(40),
EmailAdres nvarchar(60)
)

--YEN� S�TUN EKLEME ��LEM�
Alter table Personel
Add TelefonNumarasi nvarchar(12)

--S�TUN S�LME ��LEM� 
Alter table Personel
Drop column  TelefonNumarasi

--Tablo S�LME ��LEM�
drop table Personel