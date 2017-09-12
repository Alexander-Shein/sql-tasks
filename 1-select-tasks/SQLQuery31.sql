/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrderById]    Script Date: 9/11/2017 6:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery5.sql|2|0|C:\Users\PC15\AppData\Local\Temp\~vs871E.sql
ALTER   PROCEDURE [dbo].[DeleteOrderById]
@OrderID INT 
AS 
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM [dbo].[Orders] WHERE [dbo].[Orders].[OrderID] = @OrderID;
			DELETE FROM [dbo].[Order Details] WHERE [dbo].[Order Details].[OrderID] = @OrderID;
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
	