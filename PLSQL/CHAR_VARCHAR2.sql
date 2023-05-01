DECLARE
    wadi CHAR(15);
    wsoyadi varchar2(15);
BEGIN
    wadi := 'Muhammet';
    wsoyadi := 'Cosar';

    DBMS_OUTPUT.PUT_LINE('*'||wadi||'*');
    DBMS_OUTPUT.PUT_LINE('*'||wsoyadi||'*');
    
END;