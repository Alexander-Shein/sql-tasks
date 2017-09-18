
DROP TABLE IF EXISTS LostUpdate;
CREATE TABLE LostUpdate (
	Id INTEGER PRIMARY KEY NOT NULL,
	Value INTEGER NOT NULL
);

INSERT INTO LostUpdate VALUES(1,1);

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;
	UPDATE LostUpdate
	SET Value = Value + 5
	WHERE Id = 1;
	
	SELECT pg_sleep(10);
	
	SELECT  Id, Value FROM LostUpdate;
COMMIT;


BEGIN;
	UPDATE LostUpdate
	SET Value = Value + 7
	WHERE Id = 1;
	
	SELECT Value FROM LostUpdate
	WHERE Id = 1;
COMMIT;