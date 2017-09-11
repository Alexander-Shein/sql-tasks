SELECT e.EmployeeID, concat (e.FirstName ,' ', e.LastName) AS "Employee Full Name", Title, City
FROM Employees e
ORDER BY City, "Employee Full Name";