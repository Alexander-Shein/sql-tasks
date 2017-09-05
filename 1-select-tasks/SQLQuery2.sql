/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [o].[OrderID], SUM([o].[UnitPrice] * [o].Quantity) AS [Order Total Price], SUM( [o].[Discount] / [o].[UnitPrice] * 100 ) AS [Total Order Discount, %] 
  FROM [dbo].[Order Details] [o]
  GROUP BY [o].[OrderID] 
  ORDER BY [o].[OrderID] DESC;