SELECT [c].[CompanyName], [p].[ProductName], [od].[UnitPrice] AS [PricePerItem]
FROM [dbo].[Order Details] [od]
JOIN [dbo].[Orders] [o] ON [od].[OrderID] = [o].[OrderID]
JOIN [dbo].[Customers] [c] ON [o].[CustomerID] = [c].[CustomerID]
JOIN [dbo].[Products] [p] ON [od].[ProductID] = [p].[ProductID]
WHERE [od].[UnitPrice] = (
	SELECT MAX( [odi].[UnitPrice]) 
	FROM [dbo].[Order Details] [odi]
	JOIN [dbo].[Orders] [oi] ON [odi].[OrderID] = [oi].[OrderID]
	JOIN [dbo].[Customers] [ci] ON [oi].[CustomerID] = [c].[CustomerID]
	)
	ORDER BY [c].[CustomerID]

SELECT [c].[CompanyName], [p].[ProductName], [od].[UnitPrice] AS [PricePerItem]
FROM [dbo].[Order Details] [od]
JOIN [dbo].[Orders] [o] ON [od].[OrderID] = [o].[OrderID]
JOIN [dbo].[Customers] [c] ON [o].[CustomerID] = [c].[CustomerID]
JOIN [dbo].[Products] [p] ON [od].[ProductID] = [p].[ProductID]
WHERE [od].[UnitPrice] >= ALL (
	SELECT [odi].[UnitPrice] 
	FROM [dbo].[Order Details] [odi]
	JOIN [dbo].[Orders] [oi] ON [odi].[OrderID] = [oi].[OrderID]
	JOIN [dbo].[Customers] [ci] ON [oi].[CustomerID] = [c].[CustomerID]
	)
	ORDER BY [c].[CustomerID]







