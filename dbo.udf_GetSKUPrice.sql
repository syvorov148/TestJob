create function dbo.ufnGetInventoryStock(@ID_SKU int) 
returns decimal(18, 2)
as
begin
	declare @res decimal(18, 2);
	select @res = sum(Value) / sum(Quantity) 
	from dbo.Basket
	where ID_SKU = @ID_SKU;
	return @res;
end;