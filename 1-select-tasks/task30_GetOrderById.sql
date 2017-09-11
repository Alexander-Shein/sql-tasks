CREATE PROCEDURE GetOrderById
	@OrderId INT

AS

	SELECT * FROM [dbo].[Orders] [o]
	WHERE [o].[OrderID] = @OrderId;
	SELECT * FROM [dbo].[Order Details] [od]
	WHERE [od].[OrderID] = @OrderId;