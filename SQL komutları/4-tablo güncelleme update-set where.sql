--update
--genel kullan�m
--update TabloAdi
--set
--kolon1 = YeniDeger
--kolon2 = YeniDeger
--where 

--veri �zerinde de�i�tirme yapma i�lemi
update Personel
set 
Soyisim='BOZ',
Isim = 'CAN'
where 
PersonelID = 5

--tabloyu g�sterme
select * from Personel