/*
** ������� �������� ��������� ������� ��������� OrderID ������� Order � Order Details �� ����� ID. (DeleteOrderById)

*/

CREATE PROCEDURE [dbo].[DeleteOrderById] (@OrderId INT) 
AS
BEGIN TRY
	BEGIN TRANSACTION;
		DELETE FROM [dbo].[Order Details] WHERE [Order Details].[OrderId]=@OrderId;
		DELETE FROM [dbo].[Orders] WHERE [OrderId]=@OrderId;
	COMMIT TRANSACTION;
END TRY 
BEGIN CATCH
	ROLLBACK ;
END CATCH
