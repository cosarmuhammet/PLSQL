-- Cursors Parametre Kullanimi (CURSORS WITH PARAMETERS) (NESTED CURSOR):Ýç içe
-- LOKASYON (locations) -—> BOLUMLER ((Departments) ---> CALISANLAR (employees)

DECLARE
    CURSOR c_loc IS SELECT location_id, city FROM LOCATIONS ORDER BY city;
    r_loc   c_loc%ROWTYPE;
    
    CURSOR c_dept(p_loc_id  departments.location_id%type ) IS
                    SELECT department_id, department_name FROM DEPARTMENTS 
                    WHERE location_id = p_loc_id
                    ORDER BY department_name;
    r_dept  c_dept%ROWTYPE;
    
    CURSOR  c_emp(p_dept employees.department_id%type) IS
                    SELECT employee_id, first_name ||' '|| last_name ad_soyad, hire_date, job_id
                    FROM EMPLOYEES
                    WHERE department_id = p_dept ORDER BY employee_id;
    r_emp   c_emp%ROWTYPE;
    
    
BEGIN
    
    
    OPEN c_loc; --location
    LOOP
        FETCH c_loc INTO r_loc ; --Lokasyon
        EXIT WHEN c_loc%NOTFOUND;
        DBMS_OUTPUT.NEW_LINE;  -- Yeni satýra geçme
        dbms_output.put_line(' Lokasyon : ' || r_loc.city || '(ID:'|| r_loc.location_id || ')');
    
    
        OPEN c_dept(r_loc.location_id);
        LOOP
            FETCH C_DEPT INTO r_dept; -- Departments
            EXIT WHEN c_dept%NOTFOUND;
            dbms_output.put_line('      ' || r_dept.department_name || '(ID:'|| r_dept.department_id || ')');
            
            
            OPEN c_emp(r_dept.department_id);
            LOOP
                FETCH c_emp INTO r_emp; -- Employees
                EXIT WHEN c_emp%NOTFOUND;
                dbms_output.put_line('           ' || r_emp.ad_soyad || '(' || r_emp.employee_id  
                                    || '-' || r_emp.job_id || ' - ' ||TO_CHAR(r_emp.hire_date, 'DD/MM/YYYY') || ')');
            END LOOP;
            CLOSE c_emp;
            
        END LOOP;
        CLOSE c_dept;
        
    END LOOP;
    CLOSE c_loc;
    

END;


