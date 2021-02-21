--update
--genel kullaným
--update TabloAdi
--set
--kolon1 = YeniDeger
--kolon2 = YeniDeger
--where 

--veri üzerinde deðiþtirme yapma iþlemi
update Personel
set 
Soyisim='BOZ',
Isim = 'CAN'
where 
PersonelID = 5

--tabloyu gösterme
select * from Personel