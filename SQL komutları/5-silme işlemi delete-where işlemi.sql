--veri silmek i�in delete komutundan faydalan�yoruz

--Genel kullan�m:
--delete TabloAdi  where kriter

--personel tablosunda email bo� olan yerin personelID=2 e�itle
update Personel
set
PersonelID=2
where
EmailAdres=''

--Tablo tamam�n� g�steriyoruz.
select *from Personel

--veri silme i�lemi yap�yoruz.
 delete Personel
 where PersonelID=2
