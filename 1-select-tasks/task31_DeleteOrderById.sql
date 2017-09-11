ALTER PROCEDURE [dbo].[DeleteOrderById]
	@OrderId INT

AS 
	BEGIN TRY
		BEGIN TRAN;
			DELETE FROM [dbo].[Order Details]
			WHERE [dbo].[Order Details].[OrderId] = @OrderId;
			DELETE FROM [dbo].[Orders]
			WHERE [dbo].[Orders].[OrderId] = @OrderId;
		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		ROLLBACK;
	END CATCH;
