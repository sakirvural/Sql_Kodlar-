-- % : Birden fazla bilinmeyen karakteri temsil ediyor
-- _ : tek bir karakteri temsil eder


select EnglishProductName from DimProduct 
where 
EnglishProductName  like '%d%' --i�erisinde d ge�en sat�rlar� getir


select EnglishProductName from DimProduct 
where 
EnglishProductName not like '%d%' --i�erisinde d ge�meyen sat�rlar� getir


select EnglishProductName from DimProduct 
where 
EnglishProductName  like 'L%' -- ba�� L ile ba�lay�p sonunda herhangi bir karakter biten


select EnglishProductName from DimProduct 
where 
EnglishProductName  like '%d' -- ba�� herhangi bir karakter olan sonunda L ile biten

select EnglishProductName from DimProduct 
where 
EnglishProductName  like '____e' -- ilk 4 karakteri herhangi bir�ey olan sonu e ile biten