-- COLLECTIONS METOD TRIM

DECLARE 
    TYPE varr_type IS VARRAY(10) OF INTEGER;
    var1 varr_type := varr_type(10, 21, 23, 49, 60, 63);

BEGIN 
    dbms_output.new_line;
    dbms_output.put_line(' Orjinal degerler ---');
    
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line(' var1('|| i || ')=' || var1(i));
    
    END LOOP;
    
    var1.TRIM;          --dizinin son elemanýný silme
    dbms_output.new_line;
    dbms_output.put_line(' TRIM KULLANILDI ---');
    
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line(' var1('|| i || ')=' || var1(i));
    
    END LOOP;

    --var1.TRIM(2); --Son 2 elemaný diziden siler.


END;