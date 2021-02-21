--HANGÝ DATABASE ÜZERÝNDEN ÝÞLEM YAPICAÐIMI BELÝRTME 
use SQLFULL
GO
--TABLO OLUÞTURMA
create table Personel
(
PersonelID int ,
Isim nvarchar(40),
Soyisim nvarchar(40),
EmailAdres nvarchar(60)
)

--YENÝ SÜTUN EKLEME ÝÞLEMÝ
Alter table Personel
Add TelefonNumarasi nvarchar(12)

--SÜTUN SÝLME ÝÞLEMÝ 
Alter table Personel
Drop column  TelefonNumarasi

--Tablo SÝLME ÝÞLEMÝ
drop table Personel