
/* плохой */

begin transaction isolation level read committed;

update products set unitsinstock=0 where productid=55;

commit transaction