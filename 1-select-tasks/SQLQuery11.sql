SELECT [p].[ProductName], [p].[UnitPrice] 
FROM [dbo].[Products] [p] 
WHERE [p].[UnitPrice] BETWEEN 5 AND 15;