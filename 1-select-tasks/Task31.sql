--Создать хранимую процедуру которая принимает OrderID удаляет Order и Order Details по этому ID. (DeleteOrderById)

USE [Northwind]
GO

GO
CREATE PROCEDURE DeleteOrderById(@OrderID  INTEGER)
	AS
		BEGIN TRAN

			BEGIN TRY
				DELETE FROM [Order Details]
					WHERE [OrderID] = @OrderID
	
				DELETE FROM [Orders]
					WHERE [OrderID] = @OrderID
			END TRY

			BEGIN CATCH
				PRINT 'Error'
				ROLLBACK COMMIT
			END CATCH

		COMMIT TRANSACTION
GO 

EXECUTE DeleteOrderById 10251