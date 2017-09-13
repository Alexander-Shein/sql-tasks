CREATE OR REPLACE FUNCTION query1() 
    RETURNS void AS $BODY$
    DECLARE
   		localVar INT;
    BEGIN
		SELECT var INTO localVar FROM lostupdatedemo WHERE ID = 2 LIMIT 1;
		PERFORM PG_SLEEP(7);
		localVar := localVar + 17;
		UPDATE lostupdatedemo SET var = localVar WHERE ID = 2;
		RAISE NOTICE 'LocalVar =  %', localVar;
    END;
    $BODY$ LANGUAGE plpgsql;
    
   
    
   