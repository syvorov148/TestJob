CREATE TRIGGER TR_Basket_insert
ON dbo.Basket
AFTER INSERT
AS
  DECLARE @sku INT = 0;  
  
  SELECT @sku = ID_SKU
  FROM inserted 
  GROUP BY ID_SKU
  HAVING COUNT(ID_SKU) >= 2
    
   

 UPDATE dbo.Basket 
  SET DiscountValue = CASE
      WHEN  @sku >= 2 THEN VALUE * 0.05
	  ELSE 0
    END
 WHERE ID_SKU = @sku 