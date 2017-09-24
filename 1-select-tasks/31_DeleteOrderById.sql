
/*
** Создать хранимую процедуру которая принимает OrderID удаляет Order и Order Details по этому ID. (DeleteOrderById)
*/

CREATE PROCEDURE [dbo].[DeleteOrderById] (@OrderId INT) 
AS
DELETE FROM [dbo].[Orders][o] WHERE [o][OrderID]=@OrderId;
DELETE FROM [dbo].[Order Details][OD] WHERE [OD].[OrderID]=@OrderId;
