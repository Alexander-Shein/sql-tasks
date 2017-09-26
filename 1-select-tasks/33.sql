USE Northwind
;

DROP PROCEDURE [UpdateOrder]
;

DROP TYPE [OrderDetailsType]
;

CREATE TYPE [OrderDetailsType] AS TABLE
(
  	ProductID INT
	, UnitPrice MONEY DEFAULT(0)
	, Quantity SMALLINT DEFAULT(1)
	, Discount REAL DEFAULT(0)
)
;

CREATE PROCEDURE [UpdateOrder]
(
	@OrderId INT
	, @OrderDetails [OrderDetailsType] READONLY
	, @CustomerId NCHAR
	, @EmployeeId INT
	, @OrderDate DATETIME
	, @RequiredDate DATETIME
	, @ShippedDate DATETIME
	, @ShipVia INT
	, @Freight MONEY
	, @ShipName NVARCHAR(40)
	, @ShipAddress NVARCHAR(60)
	, @ShipCity NVARCHAR(15)
	, @ShipRegion NVARCHAR(15)
	, @ShipPostalCode NVARCHAR(10)
	, @ShipCountry NVARCHAR(15)
)
AS
BEGIN TRY
	BEGIN TRANSACTION
	;
--Update item of table [Order]
		UPDATE [Orders]
		SET
		CustomerId = @CustomerId
		, EmployeeId = @EmployeeId 
		, OrderDate = @OrderDate
		, RequiredDate = @RequiredDate
		, ShippedDate = @ShippedDate
		, ShipVia = @ShipVia
		, Freight = @Freight
		, ShipName = @ShipName
		, ShipAddress = @ShipAddress
		, ShipCity = @ShipCity
		, ShipRegion = @ShipRegion
		, ShipPostalCode = @ShipPostalCode
		, ShipCountry = @ShipCountry
		WHERE [Orders].OrderId = @OrderId
		
--Update item of table [Order Details]
		DELETE [Order Details] WHERE [Order Details].OrderId = @OrderId
		
		INSERT INTO [Order Details]
		(
			OrderID 
			, ProductID 
			, UnitPrice 
			, Quantity
			, Discount
		)
		SELECT 
		@OrderId
		, ProductId
		, UnitPrice
		, Quantity
		, Discount
		FROM 
		@OrderDetails
		
	COMMIT TRANSACTION
	;
END TRY

BEGIN CATCH

	ROLLBACK
	;
	
END CATCH
;

DECLARE @OrdDet [OrderDetailsType]
;

INSERT INTO @OrdDet VALUES(1,25,35,0)
;

DECLARE @datetimenow DATETIME
;

SET @datetimenow = getdate()
;

EXEC [UpdateOrder] 10250, @OrdDet, 'ALFKI', 1, @datetimenow, @datetimenow, @datetimenow, 1, 1, 'asd', 'asd', 'asd', 'asd', 'asd', 'asd'
;