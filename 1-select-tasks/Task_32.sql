--Создать хранимую процедуру которая принимает в себя информацию о Order и массив Order Details и создает новый Order в системе. (CreateOrder)

GO
CREATE TYPE [dbo].[OrderDetailsList]
AS TABLE(
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL
)
GO


GO
CREATE PROCEDURE CreateOrder
	@CustomerId nchar(5),
	@EmployeeId int,
	@OrderDate datetime,
	@RequiredDate datetime,
	@ShippedDate datetime,
	@ShipVia int,
	@Freight money,
	@ShipName nvarchar(40),
	@ShipAddress nvarchar(60),
	@ShipCity nvarchar(15),
	@ShipRegion nvarchar(15),
	@ShipPostalCode nvarchar(10),
	@ShipCountry nvarchar(15),
	@List AS dbo.[OrderDetailsList] READONLY
AS
	BEGIN TRAN
		INSERT INTO [dbo].[Orders]
			([CustomerID],
			[EmployeeID],
			[OrderDate],
			[RequiredDate],
			[ShippedDate],
			[ShipVia],
			[Freight],
			[ShipName],
			[ShipAddress],
			[ShipCity],
			[ShipRegion],
			[ShipPostalCode],
			[ShipCountry] ) 
		VALUES 
			(@CustomerId,
			@EmployeeId,
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

		INSERT INTO [dbo].[Order Details]([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount])
		SELECT  @@IDENTITY, [ProductID], [UnitPrice], [Quantity], [Discount]
		FROM @List
	COMMIT TRANSACTION
GO


DECLARE @InputTable [OrderDetailsList]

INSERT INTO @InputTable(ProductID, UnitPrice, Quantity, Discount)
VALUES(22, 16.90, 6, 0.05), (25, 16.99, 4, 0.1) 

DECLARE @dt as datetime
SET @dt=GETDATE()

EXECUTE CreateOrder 'VINET', 5, @dt, @dt, @dt, 3, 32.3800, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France', @InputTable

