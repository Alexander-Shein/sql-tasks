--create table BankAccount (
--	Id INT primary key not null,
--	Amount INT not NULL
--);
--update bankaccount set amount = 0 where id = 1
--insert into bankaccount
--values(1,10), (2,10), (3,10);

--select * from bankaccount;

--dirty read problem can't be simulate in postgresql 



BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT * FROM BANKACCOUNT WHERE ID = 1;


COMMIT TRANSACTION;


BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

UPDATE bankaccount SET amount = 15
WHERE id = 1;
SELECT PG_SLEEP(10);

ROLLBACK;