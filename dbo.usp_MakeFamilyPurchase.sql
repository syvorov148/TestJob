create procedure dbo.usp_MakeFamilyPurchase 
	@FamilySurName varchar(255)
as
	declare @familyId int =0;
	select @familyId = ID 
	from dbo.Family 
	where SurName = @FamilySurName;
	if @familyId = 0
		print 'Такой семьи нет'
	update dbo.Family
	set BudgetValue = 
	(select sum(Value) 
	from dbo.Basket 
	where ID_Family = @familyId)
GO

