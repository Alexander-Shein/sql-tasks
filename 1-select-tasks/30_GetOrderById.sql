/*
** Создать хранимую процедуру которая принимает OrderId возвращает Order и Order Details двумя разными селектами. (GetOrderById)
*/

CREATE PROCEDURE [dbo].[GetOrderById] (@OrderId INT) 
AS
SELECT * FROM [dbo].[Orders][o] WHERE [o].[OrderID]=@OrderId;
SELECT * FROM [dbo].[Order Details][OD] WHERE [OD].[OrderID]=@OrderId;
