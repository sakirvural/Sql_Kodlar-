
use Boa
create schema CUS--�EMA OLU�TURMA ��LEMLER ���N CUS ADINI VERD�K
create schema COR ---- tablo isimlerinin ba��

select * from COR.Customer

--denemeDENEME3999
--dsadasd
--aaaddddsss
---deneee
--ddd



-----PARAMETRELER TABLOSU ASLI
--create table ParameterType
--(
--typeID int identity,
--parameterName nvarchar(50),
--explanation nvarchar(50)
--)


--SELECT * FROM STRING_SPLIT(@parameterName,',')--- PAR�ALAMA ��LEM�
---CONCAT string birle�tirme


--sp_rename 'COR.Customer.knowledge', 'job', 'COLUMN' --- tablo ismini de�i�me

--SELECT * FROM COR.Customer FOR JSON AUTO

---ekleme kodlar�m 
alter table COR.Customer 
add  jobID int 

alter table COR.Customer 
add foreign key(jobID) references ParameterJob(jobID) 

alter table COR.Customer 
drop column  jobID


---silme kodlar�m 
--ALTER TABLE tablo_adi DROP COLUMN s�tun_adi


ALTER TABLE PAR.ParameterType
   ADD CONSTRAINT parameterName UNIQUE(parameterName)


--parametre tipleri
create schema PAR

create table PAR.ParameterType
(
parameterTypeID int  primary key identity,
parameterName nvarchar(50)
)

---parametre
create table PAR.Parameter
(
parameterID int  primary key identity,
parameterTypeID int,
explanation nvarchar(50),
foreign key (parameterTypeID) references PAR.ParameterType(parameterTypeID)
)

--parametreleri getir
create proc sel_Parameter
(
@parameterName nvarchar(200)
)
as
begin 
select PAR.ParameterType.parameterName,explanation from PAR.Parameter  
 full join PAR.ParameterType on PAR.Parameter.parameterTypeID=PAR.ParameterType.parameterTypeID
 where PAR.ParameterType.parameterName in (SELECT * FROM STRING_SPLIT(@parameterName,','))
end

----tipleri getir
create proc sel_ParameterTypes
as
begin 
select parameterName from PAR.ParameterType
end


create proc ins_ParameterType
(
@parameterName nvarchar(50)
)
as
begin 
insert into PAR.ParameterType(parameterName) values (@parameterName)
end

create proc ins_Parameter
(
@parameterName nvarchar(50),
@explanation nvarchar(50)
)
as
begin 
insert into PAR.Parameter(parameterTypeID,explanation) values ((select parameterTypeID from PAR.ParameterType where parameterName=@parameterName),@explanation)
end








--M��TER� TABLOSU
create Table COR.Customer
(
ID int primary key identity,
customerNo varchar(20),
customerName nvarchar(30) not null,
customerSurname nvarchar(30) not null,
TC varchar(11) Unique  not null,
birthPlace nvarchar(100) not null,
birthDate date not null,
motherName nvarchar(30) not null,
fatherName nvarchar(30) not null,
educationID int,
jobID int,
openDate datetime default GETDATE(),
updateDate datetime default null,
foreign key (educationID) references PAR.Parameter(parameterID),
foreign key (jobID) references PAR.Parameter(parameterID)
)

--ID G�RE M��TER� GET�RME
create proc CUS.sel_Customer_ID
(
@ID int
)
as
begin
select ID,customerNo,customerName,customerSurname,TC,birthPlace,birthDate,motherName,fatherName,p1.explanation as education,p2.explanation as job
from COR.Customer c 
full join PAR.Parameter p1 on c.educationID = p1.parameterID 
full join PAR.Parameter p2 on c.jobID=p2.parameterID
where ID=@ID
end

--F�LTREL� OLARAK M��TER� GET�RME
create proc CUS.sel_Customer_filtre
(
@customerNo varchar(20),
@TC varchar(11),
@customerNameSurname nvarchar(50)
)
as
begin
if (select count(*) from COR.Customer where customerNo=@customerNo) = 1
begin
select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer where customerNo=@customerNo
end
if (select count(*) from COR.Customer where TC=@TC) = 1
begin
select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer where TC=@TC
end
if (select count(*) from COR.Customer where customerName=@customerNameSurname or customerSurname=@customerNameSurname) = 1
begin
select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer where customerName=@customerNameSurname or customerSurname=@customerNameSurname
end
if @customerNo='' and @TC='' and @customerNameSurname = ''
begin
select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer 
end

if @customerNo='' 
begin
select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer  
where   ( TC like (@TC+'%')) and ((( customerName like (@customerNameSurname+'%')) 
or (customerSurname like (@customerNameSurname+'%'))))
end

if @TC='' 
begin
select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer  
where  (customerNo like (@customerNo+'%')) and ((( customerName like (@customerNameSurname+'%')) 
or (customerSurname like (@customerNameSurname+'%'))))
end

if @customerNameSurname='' 
begin
select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer  
where  (customerNo like (@customerNo+'%')) and ( TC like (@TC+'%')) 
end


--else
--begin
--select ID,customerNo,customerName+''+customerSurname as NameSurname,TC,birthPlace,birthDate,motherName,fatherName from COR.Customer  
--where  (customerNo like (@customerNo+'%')) or ( TC like (@TC+'%')) or (( customerName like (@customerNameSurname+'%')) 
--or (customerSurname like (@customerNameSurname+'%')))
--end
end



--M��TER� G�RME ��LE�
create proc CUS.ins_Customer
(
@customerName nvarchar(30),
@customerSurname nvarchar(30),
@TC nvarchar(11),
@birthPlace nvarchar(100) ,
@birthDate date,
@motherName nvarchar(30) ,
@fatherName nvarchar(30),
@education nvarchar(30),
@job nvarchar(30)
--@address nvarchar(150),
--@mail nvarchar(50),
--@phoneNumber nvarchar(50)
)
as
begin
insert into COR.Customer(customerName,customerSurname,TC,birthPlace,birthDate,motherName,fatherName,educationID,jobID)
values (@customerName,@customerSurname,@TC,@birthPlace,@birthDate,@motherName,@fatherName,
(select parameterID from PAR.Parameter where explanation=@education),
(select parameterID from PAR.Parameter where explanation=@job))
if(@@ROWCOUNT>0)
begin
update COR.Customer set customerNo =CAST(SCOPE_IDENTITY() as int)  where ID =CAST(SCOPE_IDENTITY()as int)
--customerNo
--update COR.Customer set customerNo = (select Max(ID) from COR.Customer) where ID=(select Max(ID) from COR.Customer)
--insert into COR.Customer_Address(address,cusID) values (@address,(select Max(ID) from COR.Customer))
--insert into COR.Customer_Eposta(mail,cusID) values (@mail,(select Max(ID) from COR.Customer))
--insert into COR.Customer_Phone(phoneNumber,cusID) values (@phoneNumber,(select Max(ID) from COR.Customer))
select top(1) CAST(SCOPE_IDENTITY() as int) from COR.Customer
end
end

--M��TER� g�ncelleme
create proc CUS.upd_Customer
(
@ID int ,
@customerName nvarchar(30),
@customerSurname nvarchar(30),
@TC nvarchar(11),
@birthPlace nvarchar(100),
@birthDate date,
@motherName nvarchar(30) ,
@fatherName nvarchar(30),
@education nvarchar(30),
@job nvarchar(30)
)
as
begin
update COR.Customer set customerName=@customerName,customerSurname=@customerSurname,TC=@TC,birthPlace=@birthPlace,birthDate=@birthDate,
motherName=@motherName,fatherName=@fatherName,educationID=(select parameterID from PAR.Parameter where explanation=@education),
jobID=(select parameterID from PAR.Parameter where explanation=@job),updateDate=GETDATE()
where ID=@ID
end

--M��TER� S�LME ��LEM�
create proc CUS.del_Customer
(
@ID int
)
as
begin
delete COR.Customer where ID=@ID
end





----HESAP TABLOLARI ASLI
create Table COR.Customer_Account
(
customerAccountID int primary key identity,
active bit default 'true',
accountNumber int not null,
accountNumberExtra int ,--hesap 1 not null unique
accountBalance decimal(28,4) default 0,--para
currencyTypeID int,--d�viz cinsi
openDate datetime default GETDATE(),--a��l�� tarihi
closeDate datetime default null ,--kapan�� tarihi
--closeWhy nvarchar(50), --kapanma nedeni
foreign key (accountNumber) references COR.Customer(ID),
foreign key (currencyTypeID) references PAR.Parameter(parameterID)
)


--EK HESAP NO  �EKME
create proc CUS.sel_Customer_Account_Count
(
@accountNumber int
)
as
begin
if((select count(*) from COR.Customer where ID=@accountNumber) != 0)
begin
select (count(*)+1) from COR.Customer_Account where accountNumber=@accountNumber
end
else
begin
select '0'
end
end

--HESAP TABLOSUNU GET�RME M��TER� NUMARASINA G�RE
create proc CUS.sel_Customer_Account
(
@accountNumber int
)
as
begin 
select active,accountNumber,accountNumberExtra,accountBalance,p.explanation as currencyType,openDate,closeDate from COR.Customer_Account c
full join PAR.Parameter p on  c.currencyTypeID=p.parameterID
where accountNumber=@accountNumber 
end

--YEN� HESAP G�RME 

create proc CUS.ins_Customer_Account
(
@accountNumber int,
@currencyType nvarchar(30)
)
as
begin
insert COR.Customer_Account(accountNumber,accountNumberExtra,currencyTypeID)  values  (@accountNumber,
(select (count(*)+1) from COR.Customer_Account where accountNumber=@accountNumber),(select parameterID from PAR.Parameter where explanation=@currencyType))
end





--CONCANT--STR�NG �FADELER� B�RLE�T�RME

--HESABI KAPATMA
create proc CUS.del_Customer_Account---silme i�lemi
(
@accountNumber int,
@accountNumberExtra int
)
as
begin
update COR.Customer_Account set 
closeDate=GETDATE(),
active ='false'
where (accountNumberExtra=@accountNumberExtra and accountNumber=@accountNumber)
end


--PARA YATIRMA �EKME ��LEM� GER� YEN� BAK�YE G�NDERME
create proc CUS.upd_Customer_AccountBalance--para �ekme yat�rma
(
@accountNumber int,
@accountNumberExtra int,
@accountBalance decimal(28,4),
@explanation nvarchar(80),
@WhoPerson nvarchar(80)
)
as
begin
declare @newBalance decimal(28,4)
update COR.Customer_Account set 
accountBalance = accountBalance+@accountBalance,
@newBalance=accountBalance+@accountBalance
where (accountNumberExtra=@accountNumberExtra and accountNumber=@accountNumber)
insert into COR.MoneyTransferHistory(accountNumber,accountNumberExtra,explanation,WhoPerson)
values (@accountNumber,@accountNumberExtra,@explanation,@WhoPerson)
select @newBalance
end


--PARA YATIRMA �EKME ��LEM GE�M�S� TABLOSU
create table COR.MoneyTransferHistory
(
historyID int identity,
accountNumber int not null,
accountNumberExtra int not null,
--amount nvarchar(50) not null,
explanation nvarchar(80) ,
WhoPerson nvarchar(80) ,
transferHistory datetime default GETDATE(),
foreign key (accountNumber) references COR.Customer(ID)
)

--PARA YATIRMA �EKME ��LEM� GET�RME
create proc CUS.sel_MoneyTransferHistory_Read
(
@accountNumber int,
@accountNumberExtra int
)
as
begin
select * from COR.MoneyTransferHistory where (accountNumberExtra=@accountNumberExtra and accountNumber=@accountNumber)
order by historyID asc
end



--alter table COR.Customer
--alter column TC nvarchar(11)--D�N��T�RME

------------------------------------------------detay tablosu

------number
create Table COR.Customer_Phone
(
phoneID int primary key identity,
phoneTypeID int,
phoneNumber nvarchar(20) unique not null,
cusID int  not null ,
foreign key (cusID) references COR.Customer(ID),
foreign key (phoneTypeID) references PAR.Parameter(parameterID)
)

---veri getirme 
create proc CUS.sel_Customer_Phone
(
@cusID int
)
as
begin
select  p.explanation as phoneType,c.phoneNumber from COR.Customer_Phone c full join PAR.Parameter p on c.phoneTypeID = p.parameterID where c.cusID = @cusID
end

--G�R�� 
create proc CUS.ins_Customer_Phone
(
@phoneType nvarchar(30),
@phoneNumber varchar(20),
@cusID int
)
as
begin
insert into COR.Customer_Phone(phoneTypeID,phoneNumber,cusID) values ((select parameterID from PAR.Parameter where explanation=@phoneType),
@phoneNumber,@cusID)
end

----S�LME ��LEM�
create proc CUS.del_Customer_Phone
(
@phoneNumber varchar(20)
)
as
begin
delete COR.Customer_Phone where phoneNumber=@phoneNumber
end
----------------------------------
---eposta
create Table COR.Customer_Email
(
--(1,1)
emailID int primary key identity,
emailTypeID int,
email nvarchar(50) unique not null ,
cusID int  not null,
foreign key (cusID) references COR.Customer(ID),
foreign key (emailTypeID) references PAR.Parameter(parameterID)
)
---veri getirme 
create proc CUS.sel_Customer_Email
(
@cusID int
)
as
begin
select  p.explanation as emailType,c.email from COR.Customer_Email c full join PAR.Parameter p on c.emailTypeID = p.parameterID where c.cusID = @cusID
end

--G�R�� 
create proc CUS.ins_Customer_Email
(
@emailType nvarchar(30),
@email nvarchar(50),
@cusID int
)
as
begin
insert into COR.Customer_Email(emailTypeID,email,cusID) values ((select parameterID from PAR.Parameter where explanation=@emailType),
@email,@cusID)
end

----S�LME ��LEM�
create proc CUS.del_Customer_Email
(
@email nvarchar(50)
)
as
begin
delete COR.Customer_Email where email=@email
end


------adress
create Table COR.Customer_Address
(
addressID int primary key identity,
addressTypeID int,
address nvarchar(150) unique not null,
cusID int not null,
foreign key (cusID) references COR.Customer(ID),
foreign key (addressTypeID) references PAR.Parameter(parameterID)
)


---veri getirme
create proc CUS.sel_Customer_Address
(
@cusID int
)
as
begin
select  p.explanation as addressType,c.address from COR.Customer_Address c full join PAR.Parameter p on c.addressTypeID = p.parameterID where c.cusID = @cusID
end


--G�R�� 
create proc CUS.ins_Customer_Address
(
@cusID int,
@addressType nvarchar(50),
@address nvarchar(150)

)
as
begin
insert into COR.Customer_Address(addressTypeID,address,cusID) values ((select parameterID from PAR.Parameter where explanation=@addressType),
@address,@cusID)
end
---sil
create proc CUS.del_Customer_Address
(
@address nvarchar(150)
)
as
begin
delete COR.Customer_Address where address=@address
end

--create proc CUS.sel_Customer_Contact
--(
--@cusID int
--)
--as
--begin
--select  phoneNumber,mail,address from COR.Customer inner join COR.Customer_Address on 
--COR.Customer.ID=COR.Customer_Address.cusID inner join COR.Customer_Eposta on COR.Customer.ID=COR.Customer_Eposta.cusID
--inner join COR.Customer_Phone on COR.Customer.ID=COR.Customer_Phone.cusID where COR.Customer.ID=@cusID
--end

---------------------------------------login tablolar�
create Table BoaUser
(
ID int primary key identity(1,1),
userName nvarchar(50),
password nvarchar(50)
)

create proc sel_BoaLogin
(
@userName nvarchar(50),
@password nvarchar(50)
)
as
begin
select count(*) from BoaUser where  CAST(userName as binary) =CAST(@userName as binary) and  CAST(password as binary)=CAST(@password as binary)
end


