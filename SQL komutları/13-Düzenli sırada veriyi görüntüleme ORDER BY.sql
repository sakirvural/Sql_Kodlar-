--d�zenli s�rada veriyi s�ralar a harfiden z harfine kadar
select EnglishProductName,SafetyStockLevel,ProductAlternateKey from DimProduct
order by EnglishProductName asc

--d�zenli s�rada tersten veriy s�ralar z harfinden a harfine kadar
select EnglishProductName,SafetyStockLevel,ProductAlternateKey from DimProduct
order by EnglishProductName desc

--birden fazla d�zenleme yap�lacaksa 
select EnglishProductName,SafetyStockLevel,ProductAlternateKey from DimProduct
order by EnglishProductName,ProductSubcategoryKey asc