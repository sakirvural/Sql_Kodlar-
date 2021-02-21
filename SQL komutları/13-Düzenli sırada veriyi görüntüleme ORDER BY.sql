--düzenli sýrada veriyi sýralar a harfiden z harfine kadar
select EnglishProductName,SafetyStockLevel,ProductAlternateKey from DimProduct
order by EnglishProductName asc

--düzenli sýrada tersten veriy sýralar z harfinden a harfine kadar
select EnglishProductName,SafetyStockLevel,ProductAlternateKey from DimProduct
order by EnglishProductName desc

--birden fazla düzenleme yapýlacaksa 
select EnglishProductName,SafetyStockLevel,ProductAlternateKey from DimProduct
order by EnglishProductName,ProductSubcategoryKey asc