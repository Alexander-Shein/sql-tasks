/*
** Создать хранимую процедуру которая принимает в себя информацию о Order и массив Order Details и создает новый Order в системе. (CreateOrder) 
*/

/*
DROP PROCEDURE [dbo].[CreateOrder];
DROP TYPE [OD];
*/

CREATE TYPE dbo.OD
AS TABLE
(
       [ProductID] INT
      ,[UnitPrice] INT
      ,[Quantity] INT
      ,[Discount] INT
);
GO


CREATE PROCEDURE [dbo].[CreateOrder] 
(
	 @CustomerID NVARCHAR(5)
    ,@EmployeeID INT
    ,@OrderDate Date
    ,@RequiredDate Date
    ,@ShippedDate Date
    ,@ShipVia INT
    ,@Freight MONEY
    ,@ShipName NVARCHAR(40)
    ,@ShipAddress NVARCHAR(60)
    ,@ShipCity NVARCHAR(15)
    ,@ShipRegion NVARCHAR(15)
    ,@ShipPostalCode NVARCHAR(10)
    ,@ShipCountry NVARCHAR(15)
	,@List AS dbo.OD READONLY
) 
AS
BEGIN TRANSACTION;
    INSERT INTO [Orders] VALUES 
	(	 
	 @CustomerID
    ,@EmployeeID
    ,@OrderDate
    ,@RequiredDate
    ,@ShippedDate
    ,@ShipVia
    ,@Freight
    ,@ShipName
    ,@ShipAddress
    ,@ShipCity
    ,@ShipRegion
    ,@ShipPostalCode
    ,@ShipCountry
	);

	INSERT INTO [Order Details] 
	( 
		[OrderID],
		[ProductID],
		[UnitPrice],
		[Quantity],
		[Discount]
	)  
	(SELECT @@IDENTITY, [ProductID], [UnitPrice], [Quantity], [Discount] FROM @List); 
COMMIT TRANSACTION;