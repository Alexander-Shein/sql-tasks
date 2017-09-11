--lost read

create table Banks(
	Id serial primary key not null,
	Name varchar(100) not null default('-'),
	Balance money not null
)

insert into Banks(Name,Balance) values('Lisa', 10), ('Bart', 5)

--Transaction_1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
		SELECT*FROM banks;
		SELECT PG_SLEEP(5);
		SELECT*FROM banks;
COMMIT;

--Transaction_2;
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE banks SET balance = 15 WHERE Id = 1;
SELECT*FROM banks;
COMMIT;

