SELECT [c].[CustomerID], [c].[CompanyName], SUM([od].[UnitPrice] * [od].[Quantity]) AS [TotalOrdersAmount, $]
FROM [dbo].[Customers] [c]
JOIN [dbo].[Orders] [o] ON [c].[CustomerID] = [o].[CustomerID]
JOIN [dbo].[Order Details] [od] ON [o].[OrderID] = [od].[OrderID]
GROUP BY [c].[CustomerID], [c].[CompanyName]
HAVING SUM([od].[UnitPrice] * [od].[Quantity]) > 10000