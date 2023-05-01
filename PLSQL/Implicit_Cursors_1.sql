-- CURSORS - Implicit Cursýrs - SQL%FOUND (True-False deðer döndürür), SQL%NOTFOUND(True-False deðer döndürür), SQL%ROWCOUNT

DECLARE

    rec_emp     employees%rowtype;

BEGIN

    SELECT * INTO rec_emp FROM employees2 WHERE employee_id = 100;
    
    IF SQL%FOUND THEN
        dbms_output.put_line('Kayýt var ' || sql%rowcount);
    ELSE
        dbms_output.put_line('Kayýt yok ');
    END IF;
    
    
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('Kayýt yok 1 ');
    ELSE
        dbms_output.put_line('Kayýt var 1 ' || sql%rowcount);
    END IF;
    


    EXCEPTION WHEN no_data_found THEN --HATA MESAJLARI
        dbms_output.put_line('Kayýt yok EXCEPTION ');
    
    
END;
/