USE [Northwind];

DROP PROCEDURE GetOrderById;

CREATE PROCEDURE GetOrderById
@orderID INT
AS 
BEGIN
	SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate,
	ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity
	FROM dbo.Orders AS O
	WHERE O.OrderID = @orderID;
	
	SELECT OrderID, ProductID, UnitPrice, Quantity, Discount 
	FROM dbo.[Order Details] AS OD
	WHERE OD.OrderID = @orderID
END


EXECUTE GetOrderById @orderID = 11000