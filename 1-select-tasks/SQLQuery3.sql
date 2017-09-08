SELECT cus.CustomerID, cus.CompanyName
FROM Customers cus
WHERE Country LIKE 'USA' AND cus.Fax IS NOT NULL; 