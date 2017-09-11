DROP TABLE IF exists lostupdatedemo;
CREATE TABLE lostupdatedemo (
	Id INT,
	Name VARCHAR(20)
);
INSERT INTO lostupdatedemo (Id, Name) VALUES (1,'Frist'),(2,'Second');
SELECT * FROM lostupdatedemo;
COMMIT;
