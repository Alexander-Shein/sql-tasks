SELECT TOP(1) [e].[EmployeeID], [e].[FirstName] + ' ' + [e].[LastName] AS [Employee Full Name] , SUM([od].[UnitPrice] * [od].[Quantity]) AS[Amount, $] 
FROM [Orders] [o]
JOIN [Order Details] [od] ON [o].[OrderID] = [o].[OrderID]
JOIN [Employees] [e] ON [o].[EmployeeID] = [e].[EmployeeID]
GROUP BY [e].[EmployeeID], [e].[FirstName], [e].[LastName]
ORDER BY [Amount, $] DESC