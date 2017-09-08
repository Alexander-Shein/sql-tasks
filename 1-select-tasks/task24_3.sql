select c.customerid, c.companyname 
from customers as c
where c.country = 'USA' and c.fax is null;