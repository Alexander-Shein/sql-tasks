SELECT [c].[CompanyName], [p].[ProductName], [t3].[UnitPrice] AS [PricePerItem] 
FROM ( 
	SELECT [t1].[CustomerID], [t1].[UnitPrice], [t2].[ProductID]
	FROM ( 
		SELECT [c].[CustomerID], MAX([od].[UnitPrice]) AS [UnitPrice] 
		FROM [dbo].[Customers] [c]
		JOIN [dbo].[Orders] [o] ON [c].[CustomerID] = [o].[CustomerID]
		JOIN [dbo].[Order Details] [od] ON [o].[OrderID]  = [od].[OrderID]
		GROUP BY [c].[CustomerID] 
		) [t1]
	JOIN ( 
		SELECT [c].[CustomerID], [od].[ProductID], MAX([od].[UnitPrice]) AS [UnitPrice] 
		FROM [dbo].[Customers] [c]
		JOIN [dbo].[Orders] [o] ON [c].[CustomerID] = [o].[CustomerID]
		JOIN [dbo].[Order Details] [od] ON [o].[OrderID]  = [od].[OrderID]
		GROUP BY [c].[CustomerID], [od].[ProductID] 
		) [t2] 
	ON [t1].[CustomerID] = [t2].[CustomerID]
	WHERE [t1].[UnitPrice] = [t2].[UnitPrice] 
	) [t3]
JOIN [dbo].[Products] [p] ON [t3].[ProductID] = [p].[ProductID]
JOIN [dbo].[Customers] [c] ON [t3].[CustomerID] = [c].[CustomerID] 