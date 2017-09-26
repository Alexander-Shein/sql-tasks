USE Northwind
;

DROP PROCEDURE [CreateOrder]
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

CREATE PROCEDURE [CreateOrder]
(
	@OrderDetails [OrderDetailsType] READONLY
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
--Create new item of table [Order]
		INSERT INTO [Orders] 
		(
		CustomerId
		, EmployeeId
		, OrderDate
		, RequiredDate
		, ShippedDate
		, ShipVia
		, Freight
		, ShipName
		, ShipAddress
		, ShipCity
		, ShipRegion
		, ShipPostalCode
		, ShipCountry
		) 
		VALUES
		(
		@CustomerId 
		, @EmployeeId 
		, @OrderDate 
		, @RequiredDate 
		, @ShippedDate 
		, @ShipVia 
		, @Freight 
		, @ShipName 
		, @ShipAddress 
		, @ShipCity 
		, @ShipRegion 
		, @ShipPostalCode 
		, @ShipCountry 
		)
--Create new item of table [Order Details]
		INSERT INTO [Order Details]
		(
			OrderID 
			, ProductID 
			, UnitPrice 
			, Quantity
			, Discount
		)
		SELECT 
		@@IDENTITY
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

EXEC [CreateOrder] (@OrdDet, 'ALFKI', 1, @datetimenow, @datetimenow, @datetimenow, 1, 1, 'asd', 'asd', 'asd', 'asd', 'asd', 'asd')
;