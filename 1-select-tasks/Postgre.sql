SELECT EmployeeID, CONCAT(LastName,' ',FirstName) AS EmploeesFullName, Title, City
FROM Employees ORDER BY City, EmploeesFullName;

SELECT OrderID, UnitPrice*Quantity AS TotalPrice, Discount*100 AS Discount FROM Order_Details ORDER BY OrderID DESC;

SELECT CustomerID, CompanyName FROM Customers WHERE Country='USA' AND Fax IS NULL;
