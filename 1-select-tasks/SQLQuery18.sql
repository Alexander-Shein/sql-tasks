SELECT [o].[OrderDate], COUNT(*) AS [Total Number of Orders] 
FROM [dbo].[Orders] [o]
WHERE YEAR([o].[OrderDate]) = 1998 
GROUP BY [o].[OrderDate]