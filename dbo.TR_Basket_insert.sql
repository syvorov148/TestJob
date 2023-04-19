create trigger TR_Basket_insert 
on dbo.Basket
after insert
as
  declare @sku int = 0; 
  declare @sku_count int = 0;
  declare @date datetime;

  select 
	@sku = ID_SKU 
	,@sku_count = count(ID_SKU)
	,@date = PurchaseDate
  from inserted 
  group by 
	ID_SKU
	,PurchaseDate 
  order by count(ID_SKU)

  update dbo.Basket 
  set DiscountValue = case
      when  @sku_count >= 2 then Value * 0.05
	  else value * 0
    end
 where ID_SKU = @sku 
	and PurchaseDate >= @date 
	
		