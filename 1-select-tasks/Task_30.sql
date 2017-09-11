USE Northwind
GO

-- Создать хранимую процедуру которая принимает OrderId возвращает Order и Order Details двумя разными селектами. (GetOrderById)
GO
CREATE PROCEDURE GetOrderById 
@Id INTEGER
AS
	SELECT [o].[OrderID], [o].[CustomerID],[o].[EmployeeID],[o].[OrderDate],
	[o].[RequiredDate], [o].[ShippedDate],[o].[ShipVia],[o].[Freight],[o].[ShipName],
	[o].[ShipAddress],[o].[ShipAddress],[o].[ShipRegion],[o].[ShipPostalCode],[o].[ShipCountry]
	FROM [dbo].[Orders][o] WHERE [o].[OrderID] = @Id
	SELECT [od].[OrderID],[od].[ProductID],[od].[UnitPrice],[od].[Quantity],[od].[Discount]
	FROM [dbo].[Order Details][od] WHERE [od].[OrderID] = @Id
 GO
 
 EXECUTE GetOrderById 10251