-- Internally Defined Exceptions - OTHERS, Exception SCOPE
-- örnek3

DECLARE
    

BEGIN 

    INSERT INTO REGIONS VALUES (1, 'Avustralya'); --Var olan bir id ile ekleme yapma
    
    BEGIN
        DELETE FROM departments WHERE department_id = 90 ; 
        
        EXCEPTION WHEN OTHERS THEN
            dbms_output.put_line(' HATA ' || sqlcode || ' ' ||sqlerrm);
        
    END;
    
    EXCEPTION WHEN OTHERS THEN
        dbms_output.put_line(' HATA 2 ' || sqlcode || ' ' ||sqlerrm);
        
        
    
END;

