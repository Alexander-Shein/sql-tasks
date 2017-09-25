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

begin	
;

	update "Table"
	set Value = Value + 1
	where id = 1
	;
	
	select pg_sleep(2)
	;
	
	rollback
	;
	
commit
;

set transaction isolation level read uncommitted
;

begin	
;
	
	select value from "Table"
	;
	
commit
;
