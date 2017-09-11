--lost update problem cannot be simulate in postgresql

begin transaction isolation level read committed;

SELECT pg_sleep(5);

update bankaccount
set amount = amount + 5
where id = 1;

commit transaction;

select amount 
from bankaccount
where id = 1;

-----------------------------------------------

begin transaction isolation level read committed;

update bankaccount
set amount = amount + 10
where id = 1;

commit transaction;

select amount 
from bankaccount
where id = 1;