
/*
** ������� �������� ��������� ������� ��������� OrderID ������� Order � Order Details �� ����� ID. (DeleteOrderById)
*/

CREATE PROCEDURE [dbo].[DeleteOrderById] (@OrderId INT) 
AS
DELETE FROM [dbo].[Orders][o] WHERE [o][OrderID]=@OrderId;
DELETE FROM [dbo].[Order Details][OD] WHERE [OD].[OrderID]=@OrderId;
