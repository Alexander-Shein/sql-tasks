SELECT [c].[CategoryName], COUNT(*) AS [TotalNumberOfProducts]
FROM [dbo].[Categories] [c]
LEFT JOIN [dbo].[Products] [p] ON [c].[CategoryID] = [p].[CategoryID]
GROUP BY [c].[CategoryName]