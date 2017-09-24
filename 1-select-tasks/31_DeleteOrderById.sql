/*
** Создать хранимую процедуру которая принимает OrderID удаляет Order и Order Details по этому ID. (DeleteOrderById)

*/

CREATE PROCEDURE [dbo].[DeleteOrderById] (@OrderId INT) 
AS
DELETE FROM [dbo].[Order Details] WHERE [Order Details].[OrderId]=@OrderId;
DELETE FROM [dbo].[Orders] WHERE [OrderId]=@OrderId;
