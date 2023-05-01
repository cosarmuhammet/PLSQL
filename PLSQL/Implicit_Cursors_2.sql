-- CURSORS - Implicit Cursýrs - SQL%FOUND (True-False deðer döndürür), SQL%NOTFOUND(True-False deðer döndürür), SQL%ROWCOUNT

DECLARE

    rec_emp     employees%rowtype;

BEGIN

    UPDATE EMPLOYEES2 SET SALARY= SALARY * 1.20 WHERE department_id = 500;
    
    
    IF SQL%FOUND THEN
        dbms_output.put_line(sql%rowcount || ' kayýt update edildi. ');
    ELSE
        dbms_output.put_line('Update edilecek kayýt bulunamadý. ');
    END IF;
    
    
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('Update edilecek kayýt bulunamadý. -1 ');
    ELSE
        dbms_output.put_line(sql%rowcount || ' kayýt update edildi. -1 ');
    END IF;
    

    
    
END;
/