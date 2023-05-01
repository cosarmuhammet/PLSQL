 -- Nested Procedures
 -- �rnek1: Unnamed block i�inde , �al��an ismini yazd�ran procedure
 -- �rnek2: Unnamed block i�inde , �al��an ismini de�i�tiren procedure
 
 DECLARE
 
    wname           employees.first_name%type;      --GLOBAL DEGISKEN
    PROCEDURE show_name IS
        --wname           employees.first_name%type;
        wlastname       employees.last_name%type;        
    BEGIN
        SELECT first_name,last_name INTO wname,wlastname FROM employees WHERE employee_id = 101;
        dbms_output.put_line(' Calisan : ' || wlastname || ' ' || wname);
    END;
    ----------------------------------------------------------------------------
    PROCEDURE change_name IS
        --wname           employees.first_name%type;
    BEGIN
        UPDATE employees SET
            last_name = UPPER(last_name)
        WHERE employee_id =101
        RETURNING last_name INTO wname; -- update ve select birlikte kullanma = return�ng
        dbms_output.put_line(' Yeni �smi : ' ||  wname);
    END;
    
 
 BEGIN      --MAIN BLOCK
 
    show_name;
 
    change_name;
 
 
 END;
