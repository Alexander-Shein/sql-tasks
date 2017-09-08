SELECT DISTINCT [od].[ProductID], [p].[ProductName] AS [Name] 
FROM [dbo].[Order Details] [od]
JOIN [dbo].[Products] [p] ON [od].[ProductID] = [p].[ProductID]  
WHERE [od].[Discount] > 0
