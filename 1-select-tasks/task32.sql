-- To create list type variable we declare new type:

CREATE TYPE [dbo].[OrderDetailesList]
AS TABLE 
(	[ProductID] INT NOT NULL,
    [UnitPrice] MONEY NOT NULL,
    [Quantity] SMALLINT NOT NULL,
    [Discount] REAL NOT NULL);


-- It will store our array of order detailes without order id so far

-- Procedure to create new order

CREATE OR ALTER PROCEDURE [dbo].[CreateOrder]
	-- Declare parameter of list type
	@OrderDetailesList AS [dbo].[OrderDetailesList] READONLY,
	
	-- And data to create new order
	@CustomerId NCHAR(5),
	@EmployeeId INT,
	@OrderDate DATETIME,
	@RequiredDate DATETIME,
	@ShippedDate DATETIME,
	@ShipVia INT,
	@Freight MONEY,
	@ShipName NVARCHAR(40),
	@ShipAddress NVARCHAR(60),
	@ShipCity NVARCHAR(15),
	@ShipRegion NVARCHAR(15),
	@ShipPostalCode NVARCHAR(10),
	@ShipCountry NVARCHAR(15) 
AS
BEGIN
	SET NOCOUNT ON;

	
		BEGIN TRY
			BEGIN TRAN;
				INSERT INTO [dbo].[Orders] 
				VALUES(	@CustomerID,
						@EmployeeID,
						@OrderDate,
						@RequiredDate,
						@ShippedDate,
						@ShipVia,
						@Freight,
						@ShipName,
						@ShipAddress,
						@ShipCity,
						@ShipRegion,
						@ShipPostalCode,
						@ShipCountry)

				INSERT INTO [dbo].[Order Details]
				([dbo].[Order Detailes].[OrderId],
				[dbo].[Order Detailes].[ProductId],
				[dbo].[Order Detailes].[UnitPrice],
				[dbo].[Order Detailes].[Quantity],
				[dbo].[Order Detailes].[Discount])

				-- Use identity to get last written OrderID
				SELECT		@@IDENTITY, 
							[ProductID],
							[UnitPrice],
							[Quantity],
							[Discount]
				FROM @OrderDetailesList
			COMMIT TRAN;
		END TRY
		BEGIN CATCH
			ROLLBACK;
		END CATCH;
	
	
END

-- And then lets test it

DECLARE	@CustomerId NCHAR(5) = 'ALFKI', 
		@EmployeeId INT = 2, 
		@OrderDate DATETIME = GETDATE(), 
		@RequiredDate DATETIME = GETDATE(),
		@ShippedDate DATETIME = GETDATE(),
		@ShipVia INT = 1,
		@Freight MONEY = 100.0,
		@ShipName NVARCHAR(40) = 'Captain Jack Sparrow',
		@ShipAddress NVARCHAR(60) = 'Belarus',
		@ShipCity NVARCHAR(15) = 'Brest',
		@ShipRegion NVARCHAR(15) = 'East Europe',
		@ShipPostalCode NVARCHAR(10) = '444465',
		@ShipCountry NVARCHAR(15) = 'Belarus';

DECLARE @OrderDetailesList AS [dbo].[OrderDetailesList];

INSERT INTO @OrderDetailesList
		VALUES	(41, 10.0, 10, 0.1),
				(51, 100.0, 5, 0.15),
				(65, 30.0, 20, 0.1);


  

  EXEC [dbo].[CreateOrder]	@OrderDetailesList,
							@CustomerId, 
							@EmployeeId, 
							@OrderDate, 
							@RequiredDate, 
							@ShippedDate, 
							@ShipVia, 
							@Freight, 
							ShipName, 
							@ShipAddress, 
							@ShipCity, 
							ShipRegion, 
							@ShipPostalCode, 
							@ShipCountry;

