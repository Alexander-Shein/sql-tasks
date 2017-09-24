/*
** Создать хранимую процедуру которая принимает OrderId возвращает Order и Order Details двумя разными селектами. (GetOrderById)

*/



CREATE PROCEDURE [dbo].[GetOrderById] (@OrderId INT) 
AS
SELECT 
[o].OrderID,
[o].CustomerID,
[o].EmployeeID,
[o].OrderDate,
[o].RequiredDate,
[o].ShippedDate,
[o].ShipVia,
[o].ShipName,
[o].ShipAddress,
[o].ShipCity,
[o].ShipRegion,
[o].ShipPostalCode,
[o].ShipCountry
FROM [dbo].[Orders][o] WHERE [o].[OrderID]=@OrderId;

SELECT
[OD].OrderID,
[OD].ProductID,
[OD].Discount,
[OD].Quantity,
[OD].UnitPrice 
FROM [dbo].[Order Details][OD] WHERE [OD].[OrderID]=@OrderId;
