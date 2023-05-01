-- Standalone Function
-- Faktöriyel  hesaplama (RECURSIVE- Yinelemeli)

CREATE OR REPLACE FUNCTION faktoriyel(n INTEGER) RETURN INTEGER IS
    fact    INTEGER;
    
BEGIN

    IF n = 0 THEN
        fact := 1;
    ELSIF n = 1 THEN
        fact := 1;
    ELSIF n < 0 THEN
        fact := null;
    ELSE
        fact := n * faktoriyel(n-1);
    END IF;

    RETURN (fact);
END;

/
----------------------------------------
--Fonksiyonu çaðýrma

SELECT '3! = ' ||faktoriyel(3) FROM DUAL ;

/
BEGIN

    FOR I IN 1..5 LOOP 
        dbms_output.put_line( I ||' faktoriyel = ' || faktoriyel(I) );
    END LOOP;
    
END;