CREATE TRIGGER TR_Basket_insert
ON dbo.Basket
AFTER INSERT
AS
  DECLARE @sku INT = 0;
  DECLARE @sku_count INT = 0;
  
  SELECT @sku = ID_SKU, @sku_count = COUNT(ID_SKU)
  FROM inserted 
  GROUP BY ID_SKU
  ORDER BY COUNT(ID_SKU)

  UPDATE dbo.Basket 
  SET DiscountValue = CASE
      WHEN  @sku_count >= 2 THEN VALUE * 0.05
	  ELSE VALUE * 0
    END
 WHERE ID_SKU = @sku
	
		