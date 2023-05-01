-- CURSORS - Explicit Cursors - Developer -Defined Cursors
-- CURSOR DURUM BÝLGÝLERÝ %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT

DECLARE
    
    CURSOR c_emp IS SELECT employee_id, last_name FROM employees ORDER BY employee_id; -- cursor tanýmlama
    
    wemployee_id    employees.employee_id%type;
    wlast_name      employees.last_name%type;

BEGIN
    
    IF NOT c_emp%ISOPEN THEN --Kontrollü bir þekilde açma
        OPEN c_emp ; -- cursor açma
    END IF;
    
    LOOP
        FETCH c_emp INTO wemployee_id, wlast_name; -- Cursordan gelen deðerleri okumak için FETCH kullanýlýr.
        
        --EXIT WHEN c_emp%NOTFOUND; -- Okunacak veri kalmadýðýnda döngüden çýkýþ.
        EXIT WHEN NOT c_emp%FOUND OR c_emp%rowcount > 10;
    
        dbms_output.put_line('SiraNo : '|| c_emp%rowcount ||' Sicil No: '|| wemployee_id || '  Soyismi: ' || wlast_name);
            
    END LOOP;
    
    
    IF c_emp%ISOPEN THEN --Kontrollü bir þekilde kapatma
        CLOSE c_emp; --cursor kapatma
    END IF;
    
END;


