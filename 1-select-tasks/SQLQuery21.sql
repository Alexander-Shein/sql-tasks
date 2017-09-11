SELECT TOP(1) [od].[OrderID], [od].[Quantity] * [od].[UnitPrice] AS [Maximum Purchase Amount, $]
FROM [dbo].[Order Details] [od]
ORDER BY [Maximum Purchase Amount, $] DESC