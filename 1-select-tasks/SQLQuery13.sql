SELECT COUNT(*) AS [TotalOfCurrentProducts], ( SELECT COUNT(*) FROM [dbo].[Products] [pi] WHERE [pi].[Discontinued] = 1 ) AS [TotalOfDiscontinuedProducts]
FROM [dbo].[Products] [p]
WHERE [p].[Discontinued] = 0