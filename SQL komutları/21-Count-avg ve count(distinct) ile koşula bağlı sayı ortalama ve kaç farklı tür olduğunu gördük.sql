--Count Kullanimi : 
--select count(kolon) from tablo where sart

select *from DimProduct
--count toplam sayisini verir
select count(*) from DimProduct where Color='Yellow'

--avg ortalamasýný alýr 
select avg(SafetyStockLevel) from DimProduct where color='black'

--count(distinct sutun) ile kaç farklý durum olduðunu gösterir.
select count(distinct Color) from DimProduct

select Color,sum(SafetyStockLevel) as toplam from DimProduct
inner join DimProductSubcategory on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
group by Color
having sum(SafetyStockLevel)>10 ORDER BY toplam desc