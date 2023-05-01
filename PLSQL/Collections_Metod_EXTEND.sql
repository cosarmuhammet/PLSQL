-- COLLECTIONS METOD EXTEND
-- Ekleme yapar 

DECLARE 
    TYPE ndt_type IS TABLE OF INTEGER;
    var1    ndt_type := ndt_type(10, 20, 30);

    
    PROCEDURE yaz IS        --Her defasýnda tekrar yazmamak için procedure tanýmlandý.
        i   INTEGER;
    BEGIN
        i := var1.FIRST;
        WHILE i IS NOT NULL LOOP
            dbms_output.put_line(' Var1(' || i || ')= ' || var1(i) );
            i := var1.NEXT(i);
    
    END LOOP;
        dbms_output.put_line('-----------');
    END yaz;
    

BEGIN 
   
    yaz;
    var1.EXTEND(2, 1); --Birinci elemaný al, 2 adet ekle
    yaz;
   
   

END;