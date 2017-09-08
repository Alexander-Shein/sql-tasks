SELECT [cus].[CustomerID], [cus].[CompanyName]
FROM [dbo].[Customers] [cus]
WHERE [cus].[Country] LIKE 'USA' AND [cus].[Fax] IS NULL; 