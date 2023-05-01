-- CASE Kullanýmý : Simple CASE   ör:TEK - ÇÝFT

DECLARE
    sayi        number := &sayi ;  --kullanýcýdan sayý alma
    cikti       varchar2(200);

BEGIN

    CASE mod(sayi, 2) 
        WHEN 1 THEN cikti := 'Tek sayi '||sayi;
        
        ELSE        cikti := 'Çift sayý '||sayi;
        
    END CASE;
    dbms_output.put_line(cikti);


END;
 


