SELECT [c].[CustomerID], [c].[ContactName] 
FROM [dbo].[Customers] [c]
WHERE [c].[ContactName] LIKE 'F__n%';