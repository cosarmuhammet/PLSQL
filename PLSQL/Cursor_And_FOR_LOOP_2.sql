-- Cursor FOR LOOP


DECLARE
    i number := 0 ;

BEGIN
    FOR r_oku IN (SELECT  * FROM employees ORDER BY employee_id) LOOP --Cursor tanýmýna ihtiyaç kalmýyor
        i := i+1;
        dbms_output.put_line('SiraNo : '|| i ||' Sicil No: '|| r_oku.employee_id || '  Soyismi: ' || r_oku.last_name
                            || ' Adi : '|| r_oku.first_name); 

    END LOOP;

END;

