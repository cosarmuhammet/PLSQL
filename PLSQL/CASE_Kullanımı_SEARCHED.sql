-- CASE Kullan�m� : SEARCHED CASE


DECLARE
    dogumTarihi     date   := TO_DATE('28/07/2009', 'DD/MM/YYYY');
    yasi            number(3);


BEGIN
    yasi := (sysdate - dogumTarihi) / 365;
    
    CASE
        WHEN yasi < 15 THEN dbms_output.put_line('Ben bir �ocu�um. Ya��m : '||yasi);
        WHEN yasi < 20 THEN dbms_output.put_line('Ben bir gencim. Ya��m : '||yasi);
        ELSE
             dbms_output.put_line('Ben bir �ocuk de�ilim. Ya��m : '||yasi);
    END CASE; 


END;