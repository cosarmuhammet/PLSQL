 -- Nested Procedures
 -- �rnek1: Unnamed block i�inde , �al��an ismini yazd�ran procedure
 
 
 DECLARE
 
    PROCEDURE show_name IS
        wname           employees.first_name%type;
        wlastname       employees.last_name%type;
        
    BEGIN
        SELECT first_name,last_name INTO wname,wlastname FROM employees WHERE employee_id = 101;
        dbms_output.put_line(' Calisan : ' || wlastname || ' ' || wname);
    END;
 
 
 BEGIN
 
    show_name;
 
 
 
 END;