drop table if exists "Table"
;
create table "Table"
(
	Id int primary key not null,
	Value int not null
)
;

insert into "Table" values (1,1)
;


set transaction isolation level read committed
;

begin	
;
	update "Table"
	set Value = Value + 10
	where id = 1
	;
	select pg_sleep(2)
	;
	select * from "Table"
	;
	
commit
;

begin	
;
	update "Table"
	set Value = Value + 10
	where id = 1
	;
	
	select * from "Table"
	
commit
;
