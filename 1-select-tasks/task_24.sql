--Task 1
SELECT employeeId, CONCAT(firstName, lastName) AS EmployeeFullName, title, city 
FROM Employees
ORDER BY City, EmployeeFullName


--Task 2
SELECT OrderID, 
	   SUM(Quantity*UnitPrice) AS "Order Total Price", 
	   100 * SUM(Discount*Quantity)/SUM(UnitPrice*Quantity) AS "Total Order Discount, %"
FROM order_details
GROUP BY OrderID
ORDER BY OrderID DESC


--Task 3
SELECT C.CustomerID, C.CompanyName 
FROM Customers AS C
WHERE C.Country='USA' AND C.Fax IS NULL