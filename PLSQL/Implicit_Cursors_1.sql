-- CURSORS - Implicit Curs�rs - SQL%FOUND (True-False de�er d�nd�r�r), SQL%NOTFOUND(True-False de�er d�nd�r�r), SQL%ROWCOUNT

DECLARE

    rec_emp     employees%rowtype;

BEGIN

    SELECT * INTO rec_emp FROM employees2 WHERE employee_id = 100;
    
    IF SQL%FOUND THEN
        dbms_output.put_line('Kay�t var ' || sql%rowcount);
    ELSE
        dbms_output.put_line('Kay�t yok ');
    END IF;
    
    
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('Kay�t yok 1 ');
    ELSE
        dbms_output.put_line('Kay�t var 1 ' || sql%rowcount);
    END IF;
    


    EXCEPTION WHEN no_data_found THEN --HATA MESAJLARI
        dbms_output.put_line('Kay�t yok EXCEPTION ');
    
    
END;
/