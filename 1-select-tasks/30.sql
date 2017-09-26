USE Northwind
;

DROP PROCEDURE [GetOrderId]
;

CREATE PROCEDURE [GetOrderId] @OrderId INT
AS
	BEGIN;
		SELECT * FROM [Orders] WHERE [Orders].OrderId = @OrderId
		SELECT * FROM [Order Details] WHERE [Order Details].OrderId = @OrderId
	END;
;
EXEC [GetOrderId] @OrderId = 10249
		