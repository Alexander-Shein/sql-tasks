SELECT [EmployeeID], [FirstName] + ' ' + [LastName] AS [Employee Full Name], [Title], [City]
FROM [dbo].[Employees]
ORDER BY [City], [Employee Full Name];