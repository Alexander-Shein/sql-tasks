USE [Northwind];

CREATE TYPE dbo.OrderDetailsItem
AS TABLE
(
  	ProductID INT,
	UnitPrice MONEY,
	Quantity SMALLINT,
	Discount REAL
);

CREATE OR ALTER PROC dbo.updateOrder 
	@Item AS dbo.OrderDetailsItem READONLY,
	@orderId INT,
	@customerId NCHAR(5),
	@employeeId INT,
	@orderDate DATETIME,
	@requiredDate DATETIME,
	@shippedDate DATETIME,
	@shipVia INT,
	@freight MONEY,
	@shipName NVARCHAR(40),
	@shipAddress NVARCHAR(60),
	@shipCity NVARCHAR(15),
	@shipRegion NVARCHAR(15),
	@shipPostalCode NVARCHAR(10),
	@shipCountry NVARCHAR(15)
AS 
	BEGIN TRY
		BEGIN TRAN;
			BEGIN 
			SET NOCOUNT ON;
			UPDATE dbo.Orders
			SET
			CustomerID = @customerId,
			EmployeeID = @employeeId,
			OrderDate = @orderDate,
			RequiredDate = @requiredDate,
			ShippedDate = @shippedDate,
			ShipVia = @shipVia,
			Freight = @freight,
			ShipName = @shipName,
			ShipAddress = @shipAddress,
			ShipCity = @shipCity,
			ShipRegion = @shipRegion,
			ShipPostalCode = @shipPostalCode,
			ShipCountry = @shipCountry 
			WHERE @orderId = Orders.OrderID
			
			DELETE FROM dbo.[Order Details] WHERE [Order Details].OrderID = @orderId
			
			INSERT INTO dbo.[Order Details](
				OrderID,
				ProductID,
				UnitPrice,
				Quantity,
				Discount
			)
			SELECT @orderId, ProductID, UnitPrice, 
			Quantity, Discount FROM @Item	
			END;
		COMMIT TRAN;
	END TRY
	
	BEGIN CATCH
		ROLLBACK;
	END CATCH;


DECLARE @Item dbo.OrderDetailsItem

INSERT INTO @Item(
  	ProductID,
	UnitPrice,
	Quantity,
	Discount
)
VALUES (
	15, 
	23, 
	42, 
	0.0
)

DECLARE @dateNow DATETIME 
SET @dateNow = GETDATE()

EXECUTE updateOrder  @Item, 11000, 'SomeID', 1, @dateNow, @dateNow, @dateNow,
2, 42, 'Name','Nemiga', 'Minsk', 'Minsk', '200001', 'Belarus'