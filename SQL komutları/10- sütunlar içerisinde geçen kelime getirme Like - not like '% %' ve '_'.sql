-- % : Birden fazla bilinmeyen karakteri temsil ediyor
-- _ : tek bir karakteri temsil eder


select EnglishProductName from DimProduct 
where 
EnglishProductName  like '%d%' --içerisinde d geçen satýrlarý getir


select EnglishProductName from DimProduct 
where 
EnglishProductName not like '%d%' --içerisinde d geçmeyen satýrlarý getir


select EnglishProductName from DimProduct 
where 
EnglishProductName  like 'L%' -- baþý L ile baþlayýp sonunda herhangi bir karakter biten


select EnglishProductName from DimProduct 
where 
EnglishProductName  like '%d' -- baþý herhangi bir karakter olan sonunda L ile biten

select EnglishProductName from DimProduct 
where 
EnglishProductName  like '____e' -- ilk 4 karakteri herhangi birþey olan sonu e ile biten