SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS EmployeeFullName, Title, City
FROM Employees
ORDER BY City, EmployeeFullName
;


SELECT CustomerID, CompanyName
FROM Customers
WHERE Country = 'USA' AND Fax IS NULL 
;

SELECT CustomerID
, COUNT(*) AS TotalNumberOfOrders
, COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS "% of all orders"
FROM Orders
GROUP BY CustomerID
ORDER BY COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() DESC
;
