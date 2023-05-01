-- CURSORS - Implicit Curs�rs - SQL%FOUND (True-False de�er d�nd�r�r), SQL%NOTFOUND(True-False de�er d�nd�r�r), SQL%ROWCOUNT

DECLARE

    rec_emp     employees%rowtype;

BEGIN

    UPDATE EMPLOYEES2 SET SALARY= SALARY * 1.20 WHERE department_id = 500;
    
    
    IF SQL%FOUND THEN
        dbms_output.put_line(sql%rowcount || ' kay�t update edildi. ');
    ELSE
        dbms_output.put_line('Update edilecek kay�t bulunamad�. ');
    END IF;
    
    
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('Update edilecek kay�t bulunamad�. -1 ');
    ELSE
        dbms_output.put_line(sql%rowcount || ' kay�t update edildi. -1 ');
    END IF;
    

    
    
END;
/