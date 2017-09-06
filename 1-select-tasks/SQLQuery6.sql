SELECT [p].[ProductName], [c].[CategoryName], [s].[CompanyName] AS 'SupplierCompanyName'
FROM [dbo].[Products] [p]
JOIN [dbo].[Categories] [c] ON [p].[CategoryID] = [c].[CategoryID]
JOIN [dbo].[Suppliers] [s] ON [p].[SupplierID] = [s].[SupplierID]