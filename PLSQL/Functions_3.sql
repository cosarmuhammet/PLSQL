-- Nested Function
-- PROCEDURE ve FUNCTION
-- Employee id ve last name listeleme

DECLARE
    --Cursor tanýmlama
    CURSOR c_dept IS SELECT department_id FROM departments;
    r_dept  c_dept%rowtype;
    
    
    
    -----------------------FUNCTION-----------------------------------
    FUNCTION dept_name(p_dept  departments.department_id%type ) 
    RETURN departments.department_name%type  IS
        wdeptname  departments.department_name%type;
    
    BEGIN
        SELECT department_name INTO wdeptname FROM departments
        WHERE department_id = p_dept;
        
        RETURN(wdeptname);
        
        EXCEPTION WHEN NO_DATA_FOUND THEN
            RETURN(null);
    END;
    
    --------------------PROCEDURE-------------------------------------
    PROCEDURE emp_oku (p_dept  departments.department_id%type ) IS
    
    BEGIN
        dbms_output.new_line;
        dbms_output.put_line(p_dept || '-' || dept_name(p_dept) );
        dbms_output.put_line('----------------------------');
        
        FOR I IN (SELECT employee_id, last_name FROM employees WHERE department_id = p_dept) LOOP
            dbms_output.put_line(I.employee_id || ' ' || I.last_name);
        END LOOP;
    
    END;


BEGIN --MAIN BLOCK
    
    --emp_oku(60);
    
    OPEN c_dept;--Cursor açma
    
    LOOP
        FETCH c_dept INTO r_dept;--Cursordan gelen verileri okuma
        EXIT WHEN c_dept%NOTFOUND;--Veri kalmadýðýnda döngüden çýk
        emp_oku(r_dept.department_id);
    END LOOP;
    
    CLOSE c_dept;--Cursor kapatma
    

END;

