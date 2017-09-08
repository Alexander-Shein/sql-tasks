SELECT [cus].[CustomerID], COUNT(*) AS [Total number of Orders],  CAST( COUNT(*) AS DECIMAL) * 100 / (SELECT COUNT(*) FROM [dbo].[Orders] )  AS [% of all orders]
FROM [dbo].[Customers] [cus]
JOIN [dbo].[Orders] [ord] ON [cus].[CustomerID] = [ord].[CustomerID]
GROUP BY [cus].[CustomerID] 
ORDER BY [% of all orders] DESC