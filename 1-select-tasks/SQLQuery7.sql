SELECT [e].[EmployeeID], [e].[FirstName] + ' ' + [e].[LastName] AS [FullName],  [r].[FirstName] + ' ' + [r].[LastName] AS [ReportsTo]
FROM [dbo].[Employees] [e]
LEFT JOIN [dbo].[Employees] [r] ON [e].[ReportsTo] = [r].[EmployeeID]
ORDER BY [e].[EmployeeID]