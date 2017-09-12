
/* хороший */

begin transaction isolation level read committed;
select * from Products as p where p.unitsinstock=0;

select pg_sleep(3);

select * from Products as p where p.unitsinstock=0;
commit transaction

