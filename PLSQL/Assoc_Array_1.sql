--Collection Data Types 1)Associative Array Index By Tables
-- Örnek : 1'den 10'a kadar sayýlarýn karesini bulup ekrana yazdýrma
-- INDEX ve DEÐER, her ikisi de sayýsal wkare(INDEX) := DEÐER


DECLARE
    TYPE t_assoc_num IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    wkare t_assoc_num;
    j number;
    

BEGIN
    FOR i IN 1..10 LOOP
        wkare(i) := POWER(i,2); --karesini alm
    
    END LOOP;

    j := wkare.first;
    WHILE j IS NOT NULL LOOP
        dbms_output.put_line(j ||' karesi = '||wkare(j));
        j := wkare.next(j);
    
    END LOOP;


END;