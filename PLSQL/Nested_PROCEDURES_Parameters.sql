 -- Nested Procedures
 -- Örnek3 : Parametreli Procedures
 
DECLARE
    CURSOR c_emp  IS  SELECT employee_id FROM employees WHERE department_id = 90;
    r_emp   c_emp%rowtype;
 
    wname           employees.first_name%type;      --GLOBAL DEGISKEN
    PROCEDURE show_name (p_id IN employees.employee_id%type) IS
        --wname           employees.first_name%type;
        wlastname       employees.last_name%type;        
    BEGIN
        SELECT first_name,last_name INTO wname,wlastname FROM employees WHERE employee_id = p_id;
        dbms_output.put_line(' Calisan : ' || wlastname || ' ' || wname);
    END;
    ----------------------------------------------------------------------------
    PROCEDURE change_name (p_id IN employees.employee_id%type) IS
        --wname           employees.first_name%type;
    BEGIN
        UPDATE employees SET
            last_name = UPPER(last_name)
        WHERE employee_id = p_id
        RETURNING last_name INTO wname; -- update ve select birlikte kullanma = returnýng
        dbms_output.put_line(' Yeni Ýsmi : ' ||  wname);
    END;
    
 
BEGIN      --MAIN BLOCK
 
    OPEN c_emp;
    LOOP
        FETCH   c_emp INTO r_emp;
        EXIT WHEN c_emp%NOTFOUND;
        
        show_name(r_emp.employee_id);
 
        change_name(r_emp.employee_id);
        
    END LOOP;
    CLOSE c_emp;
 
    --show_name(101);
    -- change_name(101);
 
 
END;
