--lost read

create table Banks(
	Id serial primary key not null,
	Name varchar(100) not null default('-'),
	Balance money not null
)

insert into Banks(Name,Balance) values('Lisa', 10), ('Bart', 5)

--Transaction_1
INSERT INTO BANKS(NAME,BALANCE) VALUES('Maggy', 15)
SELECT*FROM BANKS


--Transaction_2;
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
		SELECT PG_SLEEP(5);
		SELECT*FROM banks
COMMIT;
