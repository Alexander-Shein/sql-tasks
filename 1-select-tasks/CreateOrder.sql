USE Northwind;


CREATE TYPE dbo.OrderDetailsItem AS TABLE (
  	ProductID INT,
	UnitPrice MONEY,
	Quantity INT,
	Discount REAL
);


CREATE OR ALTER PROCEDURE dbo.createOrder 
	@Item AS dbo.OrderDetailsItem READONLY,
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
			--SET NOCOUNT ON;
			INSERT INTO dbo.Orders(
				CustomerID,
				EmployeeID,
				OrderDate,
				RequiredDate,
				ShippedDate,
				ShipVia,
				Freight,
				ShipName,
				ShipAddress,
				ShipCity,
				ShipRegion,
				ShipPostalCode,
				ShipCountry
			)
			VALUES(
				@customerId,
				@employeeId,
				@orderDate,
				@requiredDate,
				@shippedDate,
				@shipVia,
				@freight,
				@shipName,
				@shipAddress,
				@shipCity,
				@shipRegion,
				@shipPostalCode,
				@shipCountry
			)
			
			INSERT INTO dbo.[Order Details](
				dbo.OrderID,
				dbo.ProductID,
				dbo.UnitPrice,
				dbo.Quantity,
				dbo.Discount
			)
			
			SELECT @@IDENTITY, ProductID, UnitPrice, 
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

EXECUTE createOrder  @Item, 'SomeID', 1, @dateNow, @dateNow, @dateNow,
2, 42, 'Name','Nemiga', 'Minsk',
'Minsk', '200001', 'Belarus'