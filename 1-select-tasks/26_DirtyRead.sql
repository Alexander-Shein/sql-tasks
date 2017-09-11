--dirty read

create table Banks(
	Id serial primary key not null,
	Name varchar(100) not null default('-'),
	Balance money not null
)

insert into Banks(Name,Balance) values('Lisa', 10), ('Bart', 5)

SELECT*FROM banks


--Transaction_1
BEGIN;
	UPDATE BANKS 
	SET BALANCE = BALANCE + MONEY(1)
	WHERE ID = 1; 
	SELECT PG_SLEEP(5);
ROLLBACK;

--Transaction_2;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;   --In PostgreSQL READ UNCOMMITTED is treated as READ COMMITTED"
BEGIN;
SELECT *FROM BANKS;
COMMIT;


	


