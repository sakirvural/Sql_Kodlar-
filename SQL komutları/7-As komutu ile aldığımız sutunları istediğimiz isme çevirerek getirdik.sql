select * from DimProduct

--sütunlara isim vermek için as komutunu kullanýyoruz select ile from arasýnda

select  ProductAlternateKey as UrunAnahtar,
EnglishProductName as [Ingiliz Anahtar ADI]
from DimProduct