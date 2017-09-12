CREATE OR ALTER PROCEDURE [dbo].[UpdateOrder]
	-- Declare parameter of list type
	@OrderDetailesList AS [dbo].[OrderDetailesList] READONLY,

	-- Declare an OrderId paramater on which we will update our order
	@OrderId INT,
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
	SET NOCOUNT ON;
	DECLARE @ProductId INT, 
			@UnitPrice MONEY,
			@Quantity SMALLINT,
			@Discount REAL

	DECLARE @Cursor CURSOR
	SET @Cursor = CURSOR SCROLL 
	FOR
	SELECT * FROM @OrderDetailesList

	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;
				UPDATE [dbo].[Orders]
				SET [dbo].[Orders].[CustomerId] = @CustomerId,
					[dbo].[Orders].[EmployeeID] = @EmployeeId,
					[dbo].[Orders].[OrderDate] = @OrderDate,
					[dbo].[Orders].[RequiredDate] = @RequiredDate,
					[dbo].[Orders].[ShippedDate] = @ShippedDate,
					[dbo].[Orders].[ShipVia] = @ShipVia,
					[dbo].[Orders].[Freight] = @Freight,
					[dbo].[Orders].[ShipName] = @ShipName,
					[dbo].[Orders].[ShipAddress] = @ShipAddress,
					[dbo].[Orders].[ShipCity] = @ShipCity,
					[dbo].[Orders].[ShipRegion] = @ShipRegion,
					[dbo].[Orders].[ShipPostalCode] = @ShipPostalCode,
					[dbo].[Orders].[ShipCountry] = @ShipCountry
				WHERE [dbo].[Orders].[OrderID] = @OrderId

				DELETE FROM [dbo].[Order Details]
				WHERE [dbo].[Order Details].[OrderID] = @OrderId

				OPEN @Cursor
				FETCH NEXT FROM @Cursor INTO @ProductId, @UnitPrice, @Quantity, @Discount
				WHILE @@FETCH_STATUS = 0
				BEGIN
					INSERT [dbo].[Order Details]
					VALUES (
						@OrderId,
						@ProductId,
						@UnitPrice,
						@Quantity,
						@Discount)
					
					FETCH NEXT FROM @Cursor INTO @ProductId, @UnitPrice, @Quantity, @Discount
				END
				CLOSE @CURSOR;
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH 
			SELECT ERROR_NUMBER() AS [ErrorNumber]  
            ,ERROR_SEVERITY() AS [ErrorSeverity]  
            ,ERROR_STATE() AS [ErrorState]  
            ,ERROR_LINE () AS [ErrorLine]  
            ,ERROR_PROCEDURE() AS [ErrorProcedure]  
            ,ERROR_MESSAGE() AS [ErrorMessage];
			ROLLBACK;
		END CATCH;


	END;

	------------------------ TESTS ---------------------------------------------

	DECLARE	@CustomerId NCHAR(5) = 'ALFKI', 
		@EmployeeId INT = 2, 
		@OrderDate DATETIME = GETDATE(), 
		@RequiredDate DATETIME = GETDATE(),
		@ShippedDate DATETIME = GETDATE(),
		@ShipVia INT = 1,
		@Freight MONEY = 100.0,
		@ShipName NVARCHAR(40) = 'Captain Jack Sparrow',
		@ShipAddress NVARCHAR(60) = 'Belarus',
		@ShipCity NVARCHAR(15) = 'Minsk',
		@ShipRegion NVARCHAR(15) = 'East Europe',
		@ShipPostalCode NVARCHAR(10) = '444465',
		@ShipCountry NVARCHAR(15) = 'Belarus',

		@OrderId INT = 11093;

DECLARE @OrderDetailesList AS [dbo].[OrderDetailesList];

INSERT INTO @OrderDetailesList
		VALUES	(1, 7.0, 13, 0.1);


  

  EXEC [dbo].[UpdateOrder]	@OrderDetailesList,

							@OrderId,

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