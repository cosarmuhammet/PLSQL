-- CURSORS - Explicit Cursors - Developer -Defined Cursors
-- CURSOR DURUM B�LG�LER� %ISOPEN, %NOTFOUND, %FOUND, %ROWCOUNT
--Curs�rs and Records (Reference Data Type %ROWTYPE)

DECLARE
    
    CURSOR c_emp IS SELECT employee_id, last_name FROM employees ORDER BY employee_id; -- cursor tan�mlama
    
    --wemployee_id    employees.employee_id%type;
    --wlast_name      employees.last_name%type;
    
    r_oku c_emp%ROWTYPE; --tek sat�rda cursordan gelen b�t�n de�i�kenleri alma

BEGIN
    
    IF NOT c_emp%ISOPEN THEN --Kontroll� bir �ekilde a�ma
        OPEN c_emp ; -- cursor a�ma
    END IF;
    
    LOOP
        --FETCH c_emp INTO wemployee_id, wlast_name; -- Cursordan gelen de�erleri okumak i�in FETCH kullan�l�r.
        FETCH c_emp INTO r_oku;
        --EXIT WHEN c_emp%NOTFOUND; -- Okunacak veri kalmad���nda d�ng�den ��k��.
        EXIT WHEN NOT c_emp%FOUND OR c_emp%rowcount > 10;
    
        dbms_output.put_line('SiraNo : '|| c_emp%rowcount ||' Sicil No: '|| r_oku.employee_id || '  Soyismi: ' || r_oku.last_name
                            || ' Adi : '|| r_oku.first_name);
            
    END LOOP;
    
    
    IF c_emp%ISOPEN THEN --Kontroll� bir �ekilde kapatma
        CLOSE c_emp; --cursor kapatma
    END IF;
    
END;


