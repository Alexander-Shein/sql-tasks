select 	o.orderid, sum(od.unitprice*od.quantity) as "Total Price",
		sum(od.discount*od.quantity)*100/sum(od.unitprice*od.quantity) as "Total Order Discount, %"
from orders as o
join order_details od on o.orderid = od.orderid
group by o.orderid
order by o.orderid desc;