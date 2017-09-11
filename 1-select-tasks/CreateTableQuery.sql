DROP TABLE IF exists PhantomReadDemo;
CREATE TABLE PhantomReadDemo (
	Id INT,
	Name VARCHAR(20)
);
INSERT INTO PhantomReadDemo (Id, Name) VALUES (1,'Frist'),(2,'Second');