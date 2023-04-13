CREATE TRIGGER TR_Basket_insert
ON dbo.Basket
AFTER INSERT
AS
	DECLARE @sku INT = 0;
	
	SELECT @sku = A.ID_SKU
	FROM
		(SELECT ID_SKU, COUNT(*) AS CNT
		FROM inserted 
		GROUP BY ID_SKU) AS A 
	WHERE A.CNT >= 2

	IF @sku = 0
	BEGIN
		RETURN;
	END;

	UPDATE dbo.Basket 
	SET DiscountValue = Value * 0.05
	WHERE ID_SKU = @sku;
 
GO