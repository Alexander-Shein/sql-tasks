SELECT [o].[OrderID], [o].[CustomerID], [o].[ShipCountry]
FROM [dbo].[Orders] [o]
WHERE [o].[ShipPostalCode] IS NOT NULL