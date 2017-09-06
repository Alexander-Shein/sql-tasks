SELECT [o].[OrderDate], COUNT(*) AS 'Total Number of Orders' 
FROM [dbo].[Orders] [o]
WHERE [o].[OrderDate] BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY [o].[OrderDate]