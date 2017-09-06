SELECT [p].[ProductName], [p].[UnitsOnOrder], [p].[UnitsInStock] 
FROM [dbo].[Products] [p]
WHERE [p].[UnitsInStock] < [p].[UnitsOnOrder]