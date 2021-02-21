--veri silmek için delete komutundan faydalanýyoruz

--Genel kullaným:
--delete TabloAdi  where kriter

--personel tablosunda email boþ olan yerin personelID=2 eþitle
update Personel
set
PersonelID=2
where
EmailAdres=''

--Tablo tamamýný gösteriyoruz.
select *from Personel

--veri silme iþlemi yapýyoruz.
 delete Personel
 where PersonelID=2
