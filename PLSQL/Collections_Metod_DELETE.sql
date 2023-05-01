-- COLLECTIONS METHODS DELETE

DECLARE 
    TYPE ndt_sayilar IS TABLE OF INTEGER;
    dizi ndt_sayilar := ndt_sayilar(10, 21, 23, 49, 60, 63);

BEGIN 
    dbms_output.new_line;
    dbms_output.put_line(' Orjinal ---');
    
    FOR i IN 1..dizi.count LOOP
        dbms_output.put_line(' dizi('|| i || ')=' || dizi(i));
    
    END LOOP;
    
    dizi.DELETE(2);         --2.Eleman� silme 
    dbms_output.new_line;
    dbms_output.put_line(' 2. eleman silindi ---');

    FOR i IN 1..dizi.count LOOP
        IF dizi.exists(i) THEN      -- i. eleman�n var olup olmad���n� kontrol ediyor.
            dbms_output.put_line(' dizi('|| i || ')=' || dizi(i));
        ELSE
            dbms_output.put_line(' dizi('|| i || ')=' || ' Yok');
        END IF;
        
    END LOOP;
    
    --dizi.DELETE(2, 4); -- Belirli aral�kta eleman silme (2,3,4)
    --dizi.DELETE; --T�m elemanlar� silme
     

END;