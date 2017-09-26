USE Northwind
;

DROP PROCEDURE [DeleteOrderById]
;

CREATE PROCEDURE [DeleteOrderById] @OrderId INT
AS
	BEGIN TRY
		BEGIN TRANSACTION
		;
			DELETE FROM [Order Details] WHERE [Order Details].OrderId = @OrderId
			DELETE FROM [Orders] WHERE [Orders].OrderId = @OrderId
		COMMIT TRANSACTION
		;
	END TRY
	BEGIN CATCH
		ROLLBACK
		;
	END CATCH
;

EXEC [DeleteOrderById] @OrderId = 10248;
		