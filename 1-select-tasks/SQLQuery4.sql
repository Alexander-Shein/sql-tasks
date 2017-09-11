SELECT [ord].[CustomerID] , COUNT(*) AS [Total number of Orders],  CAST( COUNT(*) AS DECIMAL) * 100 / (SELECT COUNT(*) FROM  [Northwind].[dbo].[Orders] )  AS [% of all orders]
FROM [Northwind].[dbo].[Orders] [ord]
GROUP BY [ord].[CustomerID] 
ORDER BY [% of all orders] DESC