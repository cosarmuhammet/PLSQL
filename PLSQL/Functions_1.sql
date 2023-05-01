-- Nested Function
-- Toplam bulan fonksiyon

DECLARE
    x number;
    FUNCTION toplam(a number, b number) RETURN number IS
        c   number;
    BEGIN
        c := a+b;
        RETURN(c);
    END;


BEGIN
    
    x := toplam(15, 15);
    dbms_output.put_line('Toplan = '|| x );
    

END;