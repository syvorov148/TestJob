create table dbo.SKU (
    ID int identity primary key  
    ,Name varchar(255)
    ,Code as concat('s', ID)
);

create table dbo.Family (
    ID int identity primary key
    ,SurName varchar(255)
    ,BudgetValue int
);

create table dbo.Basket (
    ID int identity primary key
    ,ID_SKU int foreign key references dbo.SKU(ID) 
    ,ID_Family int foreign key references dbo.Family(ID)
    ,Quantity decimal check (Quantity >= 0)
    ,Value int check (Value >= 0)
    ,PurchaseDate datetime default getdate()
    ,DiscountValue decimal);