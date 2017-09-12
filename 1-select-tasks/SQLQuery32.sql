USE [Northwind];
CREATE TYPE [dbo].[OrderDetailsList]
AS TABLE
(
	[ProductID] INT NOT NULL,
	[UnitPrice] MONEY NOT NULL,
	[Quantity] SMALLINT NOT NULL,
	[Discount] REAL NOT NULL
);
GO

CREATE OR ALTER PROCEDURE [dbo].[CreateOrder]
	@CustomerID NCHAR(5),
	@EmployeeID INT,
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
	@ShipCountry NVARCHAR(15),
	@OrderDetailsList AS [dbo].[OrderDetailsList] READONLY
	AS
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO [dbo].[Orders] ([CustomerID],
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
										[ShipCountry]) 
			VALUES (@CustomerID, @EmployeeID, @OrderDate ,@RequiredDate, @ShippedDate, @ShipVia, @Freight, @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry ) ;
			
			
			INSERT INTO [dbo].[Order Details] ( [OrderID],
												[ProductID],
												[UnitPrice],
												[Quantity],
												[Discount]) 
			SELECT @@IDENTITY, [ProductID], [UnitPrice], [Quantity], [Discount] FROM @OrderDetailsList; 
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT   
			 ERROR_NUMBER() AS [ErrorNumber]  
			,ERROR_SEVERITY() AS [ErrorSeverity]  
			,ERROR_STATE() AS [ErrorState]  
			,ERROR_LINE () AS [ErrorLine]  
			,ERROR_PROCEDURE() AS [ErrorProcedure]  
			,ERROR_MESSAGE() AS [ErrorMessage];  
		ROLLBACK;
END CATCH
