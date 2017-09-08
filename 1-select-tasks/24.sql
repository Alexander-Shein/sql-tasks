--Task_1
select e.employeeid as "Employy Id", concat(e.firstname,' ',e.lastname) as "FullName" , e.title as "Title", e.city as "City"
from employees as e 
order by e.city, "FullName"

--Task_2
select o.orderid as "Order Id",
sum(o.unitprice * o.quantity) as "Order Total Price",
(sum(o.discount*o.quantity))*100/(sum((o.unitprice*o.quantity))) as "Total Order Discount, %"
from order_details as o
group by o.orderid
order by o.orderid desc

--Error, a space in table

--Task_3
select c.customerid, c.companyname
from customers c
where c.country = 'USA' and (c.fax is null)