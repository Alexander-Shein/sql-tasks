/*
** ������� �������� ��������� ������� ��������� OrderId ���������� Order � Order Details ����� ������� ���������. (GetOrderById)
*/

CREATE PROCEDURE [dbo].[GetOrderById] (@OrderId INT) 
AS
SELECT * FROM [dbo].[Orders][o] WHERE [o].[OrderID]=@OrderId;
SELECT * FROM [dbo].[Order Details][OD] WHERE [OD].[OrderID]=@OrderId;
