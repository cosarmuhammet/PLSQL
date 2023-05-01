
-- PLS_INTEGER, BINARY_INTEGER,NUMBER
-- PLS_INTEGER - BINARY_INTEGER Overflow(Aþýrý yüklenme)

DECLARE
    p1 PLS_INTEGER := 2147483647; --Alabilecegi max deger
    p2 PLS_INTEGER := 1; -- max deger aþýldý 
    
    n NUMBER;
BEGIN
    n:= p1+p2;
    
    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n,'999,999,999,999.99'));
    
END;