-- CASE Kullan�m� : Simple CASE   �r:TEK - ��FT

DECLARE
    sayi        number := &sayi ;  --kullan�c�dan say� alma
    cikti       varchar2(200);

BEGIN

    CASE mod(sayi, 2) 
        WHEN 1 THEN cikti := 'Tek sayi '||sayi;
        
        ELSE        cikti := '�ift say� '||sayi;
        
    END CASE;
    dbms_output.put_line(cikti);


END;
 


