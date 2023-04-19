create view dbo.vw_SKUPrice 
as  
select 
	*
	,dbo.udf_GetSKUPrice(ID) AS SKUPrice 
FROM dbo.SKU