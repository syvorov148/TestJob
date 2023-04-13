CREATE TABLE dbo.SKU (
    ID INT IDENTITY PRIMARY KEY, 
    Name VARCHAR(255),
    Code AS concat('s', ID)
);

CREATE TABLE dbo.Family (
    ID INT IDENTITY PRIMARY KEY,
    SurName VARCHAR(255),
    BudgetValue INT
);

CREATE TABLE dbo.Basket (
    ID INT IDENTITY PRIMARY KEY,
    ID_SKU INT FOREIGN KEY REFERENCES dbo.SKU(ID),
    ID_Family INT FOREIGN KEY REFERENCES dbo.Family(ID),
    Quantity DECIMAL CHECK (Quantity >= 0), 
    Value INT CHECK (Value >= 0),
    PurchaseDate datetime default GETDATE(),
    DiscountValue DECIMAL);