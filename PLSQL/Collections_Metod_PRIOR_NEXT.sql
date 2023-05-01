-- Collections Metods PRIOR NEXT
-- Önceki deðer - Sonraki deðer

DECLARE
    
    TYPE arr_type IS VARRAY(10) OF NUMBER ;
    v_sayi  arr_type := arr_type(); 


BEGIN
   
    v_sayi.EXTEND(4);
    v_sayi(1) := 10;
    v_sayi(2) := 20;
    v_sayi(3) := 30;
    v_sayi(4) := 40;
    
    dbms_output.put_line(' PRIOR = '||v_sayi.PRIOR(3));
    dbms_output.put_line(' NEXT = '||v_sayi.NEXT(3));
    
    
END;

