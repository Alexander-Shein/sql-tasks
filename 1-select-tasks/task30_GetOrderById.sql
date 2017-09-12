CREATE PROCEDURE [dbo].[GetOrderById]
	@OrderId INT

AS

	SELECT [o].[OrderID]
      ,[o].[CustomerID]
      ,[o].[EmployeeID]
      ,[o].[OrderDate]
      ,[o].[RequiredDate]
      ,[o].[ShippedDate]
      ,[o].[ShipVia]
      ,[o].[Freight]
      ,[o].[ShipName]
      ,[o].[ShipAddress]
      ,[o].[ShipCity]
      ,[o].[ShipRegion]
      ,[o].[ShipPostalCode]
      ,[o].[ShipCountry]
	   
	FROM [dbo].[Orders] [o]
	WHERE [o].[OrderID] = @OrderId;
	SELECT [od].[OrderID]
      ,[od].[ProductID]
      ,[od].[UnitPrice]
      ,[od].[Quantity]
      ,[od].[Discount] 
	
	FROM [dbo].[Order Details] [od]
	WHERE [od].[OrderID] = @OrderId;