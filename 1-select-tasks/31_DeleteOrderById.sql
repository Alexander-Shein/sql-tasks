
/*
** ������� �������� ��������� ������� ��������� OrderID ������� Order � Order Details �� ����� ID. (DeleteOrderById)
*/

CREATE PROCEDURE [dbo].[DeleteOrderById] (@OrderId INT) 
AS
DELETE FROM [dbo].[Orders] WHERE [OrderId]=@OrderId;
DELETE FROM [dbo].[Order Details] WHERE [Order Details].[OrderId]=@OrderId;
