SELECT [cus].[CustomerID], COUNT([ord].[OrderID]) AS 'Total number of Orders',  CAST(COUNT([ord].[OrderID]) AS DECIMAL) * 100 / (SELECT COUNT([dbo].[Orders].[OrderID]) FROM [dbo].[Orders] )  AS '% of all orders'
FROM [dbo].[Customers] [cus]
JOIN [dbo].[Orders] [ord] ON [cus].[CustomerID] = [ord].[CustomerID]
GROUP BY [cus].[CustomerID] 