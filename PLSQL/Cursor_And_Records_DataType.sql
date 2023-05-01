-- CURSORS - Explicit Cursors - Developer -Defined Cursors
-- CURSOR DURUM BÝLGÝLERÝ %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT
--Cursýrs and Records (Reference Data Type %ROWTYPE)

DECLARE
    
    CURSOR c_emp IS SELECT employee_id, last_name FROM employees ORDER BY employee_id; -- cursor tanýmlama
    
    --wemployee_id    employees.employee_id%type;
    --wlast_name      employees.last_name%type;
    
    r_oku c_emp%ROWTYPE; --tek satýrda cursordan gelen bütün deðiþkenleri alma

BEGIN
    
    IF NOT c_emp%ISOPEN THEN --Kontrollü bir þekilde açma
        OPEN c_emp ; -- cursor açma
    END IF;
    
    LOOP
        --FETCH c_emp INTO wemployee_id, wlast_name; -- Cursordan gelen deðerleri okumak için FETCH kullanýlýr.
        FETCH c_emp INTO r_oku;
        --EXIT WHEN c_emp%NOTFOUND; -- Okunacak veri kalmadýðýnda döngüden çýkýþ.
        EXIT WHEN NOT c_emp%FOUND OR c_emp%rowcount > 10;
    
        dbms_output.put_line('SiraNo : '|| c_emp%rowcount ||' Sicil No: '|| r_oku.employee_id || '  Soyismi: ' || r_oku.last_name
                            || ' Adi : '|| r_oku.first_name);
            
    END LOOP;
    
    
    IF c_emp%ISOPEN THEN --Kontrollü bir þekilde kapatma
        CLOSE c_emp; --cursor kapatma
    END IF;
    
END;


