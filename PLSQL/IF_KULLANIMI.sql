-- KOÞULLU AKIÞ KONTROLLERÝ    IF

DECLARE
    dogumTarihi     date   := TO_DATE('28/07/2008', 'DD/MM/YYYY');
    yasi            number(3);


BEGIN
    yasi := (sysdate - dogumTarihi) / 365;
    
    IF yasi < 15 THEN
        DBMS_OUTPUT.PUT_LINE('Ben bir çocuðum . YAÞIM : '|| yasi);
    ELSIF yasi < 20 THEN
        DBMS_OUTPUT.PUT_LINE('Ben bir gencim . YAÞIM : '|| yasi);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ben bir çocuk deðilim . YAÞIM : '|| yasi);
    
    END IF;


END; 