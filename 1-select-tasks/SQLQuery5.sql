SELECT [p].[ProductID], [p].[ProductName], [p].[QuantityPerUnit] 
FROM [dbo].[Products] [p]
WHERE [p].[ProductName] LIKE '[A-F]%'
ORDER BY [p].[ProductName]