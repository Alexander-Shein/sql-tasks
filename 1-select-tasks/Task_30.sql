USE Northwind
GO

-- Создать хранимую процедуру которая принимает OrderId возвращает Order и Order Details двумя разными селектами. (GetOrderById)
GO
CREATE PROCEDURE GetOrderById 
@Id INTEGER
AS
		SELECT*FROM [dbo].[Orders] WHERE [OrderID] = @Id
		SELECT*FROM [dbo].[Order Details] WHERE [OrderID] = @Id
GO

EXECUTE GetOrderById 10251