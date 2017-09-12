SELECT 
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 1 THEN 1 ELSE 0 END ) AS [January],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 2 THEN 1 ELSE 0 END ) AS [February],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 3 THEN 1 ELSE 0 END ) AS [March],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 4 THEN 1 ELSE 0 END ) AS [April],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 5 THEN 1 ELSE 0 END ) AS [May],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 6 THEN 1 ELSE 0 END ) AS [June],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 7 THEN 1 ELSE 0 END ) AS [July],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 8 THEN 1 ELSE 0 END ) AS [August],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 9 THEN 1 ELSE 0 END ) AS [September],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 10 THEN 1 ELSE 0 END ) AS [October],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 11 THEN 1 ELSE 0 END ) AS [November],
SUM (CASE  WHEN MONTH([o].[OrderDate]) = 12 THEN 1 ELSE 0 END ) AS [December]
FROM [dbo].[Orders] [o]
WHERE YEAR([o].[OrderDate]) = 1997;