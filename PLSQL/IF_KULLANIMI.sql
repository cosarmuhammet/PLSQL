-- KO�ULLU AKI� KONTROLLER�    IF

DECLARE
    dogumTarihi     date   := TO_DATE('28/07/2008', 'DD/MM/YYYY');
    yasi            number(3);


BEGIN
    yasi := (sysdate - dogumTarihi) / 365;
    
    IF yasi < 15 THEN
        DBMS_OUTPUT.PUT_LINE('Ben bir �ocu�um . YA�IM : '|| yasi);
    ELSIF yasi < 20 THEN
        DBMS_OUTPUT.PUT_LINE('Ben bir gencim . YA�IM : '|| yasi);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ben bir �ocuk de�ilim . YA�IM : '|| yasi);
    
    END IF;


END; 