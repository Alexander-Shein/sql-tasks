SELECT [c].[CategoryName], AVG([p].UnitPrice) AS 'AvgPrice' 
FROM [dbo].[Categories] [c]
JOIN [dbo].[Products] [p] ON [c].CategoryID = [p].[CategoryID]
GROUP BY [c].[CategoryName]