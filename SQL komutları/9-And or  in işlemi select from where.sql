--and ve or kullan�m�

--and kesi�im ifadesi ortak olanlar� getirir
select *from DimProduct
where
color='Yellow'
and ProductSubcategoryKey='14'

--or ifadesi ko�ullardan her birini getirir
select * from DimProduct 
where 
color='Yellow' 
or color='Blue'

--in komutu ile birden fazla satir g�sterme tablo g�sterme
select * from DimProduct
where 
ProductKey in(1,2,3,4) 


