CREATE FUNCTION dbo.ufnGetInventoryStock(@ID_SKU INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
	 DECLARE @res DECIMAL(18, 2);
	 SELECT @res = SUM(Value) / SUM(Quantity) 
	 FROM dbo.Basket
	 WHERE ID_SKU = @ID_SKU;
	 RETURN @res;
END;