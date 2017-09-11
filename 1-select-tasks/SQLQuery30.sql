USE [Northwind]
GO
CREATE OR ALTER PROCEDURE [dbo].[GetOrderById]
@OrderID INT
AS   
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[Orders] [o] WHERE [o].[OrderID] = @OrderID;
	SELECT * FROM [dbo].[Order Details] [od] WHERE [od].[OrderID] = @OrderID;