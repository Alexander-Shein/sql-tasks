SELECT [EmployeeID], [FirstName] + ' ' + [FirstName] AS [Employee Full Name], [Title], [City]
FROM [dbo].[Employees]
ORDER BY [City], [Employee Full Name];