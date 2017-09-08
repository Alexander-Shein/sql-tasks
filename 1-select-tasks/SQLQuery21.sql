SELECT [od].[OrderID], MAX( [od].[Quantity] * [od].[UnitPrice] ) AS [Maximum Purchase Amount, $]
FROM [dbo].[Order Details] [od]
GROUP BY [od].[OrderID]