-- Internally Defined Exceptions - PRAGMA_EXCEPTION_INIT

DECLARE
    
    my_exception    EXCEPTION;
    PRAGMA exception_init (my_exception, -2292);

    my_exception2    EXCEPTION;
    PRAGMA exception_init (my_exception2, -00001);

BEGIN 

    INSERT INTO REGIONS VALUES (1, 'Avustralya'); --Var olan bir id ile ekleme yapma
    
    BEGIN
        DELETE FROM departments WHERE department_id = 90 ; 
    
        EXCEPTION WHEN my_exception THEN
            dbms_output.put_line(' HATA ');
    END;
    
    
    EXCEPTION WHEN my_exception2 THEN
        dbms_output.put_line(' HATA 2');
END;

