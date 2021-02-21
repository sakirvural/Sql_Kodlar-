--and ve or kullanýmý

--and kesiþim ifadesi ortak olanlarý getirir
select *from DimProduct
where
color='Yellow'
and ProductSubcategoryKey='14'

--or ifadesi koþullardan her birini getirir
select * from DimProduct 
where 
color='Yellow' 
or color='Blue'

--in komutu ile birden fazla satir gösterme tablo gösterme
select * from DimProduct
where 
ProductKey in(1,2,3,4) 


