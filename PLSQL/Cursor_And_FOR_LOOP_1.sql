-- Cursor FOR LOOP


DECLARE
    CURSOR c_emp IS SELECT  * FROM employees ORDER BY employee_id; -- cursor tanýmlama

BEGIN
    FOR r_oku IN c_emp LOOP
        
        dbms_output.put_line('SiraNo : '|| c_emp%rowcount ||' Sicil No: '|| r_oku.employee_id || '  Soyismi: ' || r_oku.last_name
                            || ' Adi : '|| r_oku.first_name); 

    END LOOP;

END;

