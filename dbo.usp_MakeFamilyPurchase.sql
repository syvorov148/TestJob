CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
	@FamilySurName VARCHAR(255)
AS
	DECLARE @familyId INT =0;
	SELECT @familyId = ID FROM dbo.Family WHERE SurName = @FamilySurName;
	IF @familyId = 0
		PRINT 'Такой семьи нет'
	UPDATE dbo.Family
	SET BudgetValue = (SELECT SUM(Value) FROM dbo.Basket WHERE ID_Family = @familyId )
GO

