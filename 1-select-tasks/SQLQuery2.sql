SELECT o.OrderID, SUM( o.UnitPrice * o.Quantity) AS "Order Total Price", SUM( o.Quantity * o.Discount ) / SUM( o.UnitPrice * o.Quantity) * 100 AS "Total Order Discount, %"
  FROM "order_details" o
  GROUP BY o.OrderID 
  ORDER BY o.OrderID DESC;