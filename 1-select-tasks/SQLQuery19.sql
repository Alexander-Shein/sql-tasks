SELECT [t2].[CustomerID], [Customers].[CompanyName], [t2].[TotalOrdersAmount, $]
FROM 
	(	SELECT [Customers].[CustomerID], SUM([t1].[AMOUNT]) AS [TotalOrdersAmount, $] 
		FROM 
		(SELECT [od].[OrderID], SUM([od].[UnitPrice] * [od].[Quantity]) AS [AMOUNT]
		 FROM [Order Details] [od]
		 JOIN  [Orders] [o] ON [od].[OrderID] = [o].[OrderID] 
		 GROUP BY [od].[OrderID] 
		) [t1]

	JOIN [Orders] ON [t1].[OrderID] = [Orders].[OrderID]
	JOIN [Customers] ON [Orders].[CustomerID] = [Customers].[CustomerID]
	GROUP BY [Customers].[CustomerID] 
	) [t2]

JOIN [Customers] ON [t2].[CustomerID] = [Customers].[CustomerID]
WHERE [t2].[TotalOrdersAmount, $] > 10000
