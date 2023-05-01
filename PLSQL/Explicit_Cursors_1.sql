-- CURSORS - Explicit Cursors - Developer -Defined Cursors

DECLARE
    
    CURSOR c_emp IS SELECT employee_id, last_name FROM employees ORDER BY employee_id; -- cursor tanýmlama
    
    wemployee_id    employees.employee_id%type;
    wlast_name      employees.last_name%type;

BEGIN
    
    OPEN c_emp ; -- cursor açma
    
    LOOP
        FETCH c_emp INTO wemployee_id, wlast_name; -- Cursordan gelen deðerleri okumak için FETCH kullanýlýr.
        
        EXIT WHEN c_emp%NOTFOUND; -- Okunacak veri kalmadýðýnda döngüden çýkýþ.
    
        dbms_output.put_line('SiraNo : '|| c_emp%rowcount ||' Sicil No: '|| wemployee_id || '  Soyismi: ' || wlast_name);
            
    END LOOP;
    
    CLOSE c_emp; --cursor kapatma

END;




