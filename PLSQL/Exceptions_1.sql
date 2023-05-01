-- Internally Defined Exceptions - PRAGMA_EXCEPTION_INIT

DECLARE
    
    my_exception    EXCEPTION;
    PRAGMA exception_init (my_exception, -2292);


BEGIN 

    DELETE FROM departments WHERE department_id = 90 ;
     
    
    EXCEPTION WHEN my_exception THEN
        dbms_output.put_line(' HATA ');
END;

