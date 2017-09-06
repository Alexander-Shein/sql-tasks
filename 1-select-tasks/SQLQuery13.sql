SELECT COUNT(*) AS 'TotalOfCurrentProducts', ( SELECT COUNT(*) FROM [dbo].[Products] [p] WHERE [p].[Discontinued] = 1 ) AS 'TotalOfDiscontinuedProducts'
FROM [dbo].[Products] [p]
where [p].[Discontinued] = 0