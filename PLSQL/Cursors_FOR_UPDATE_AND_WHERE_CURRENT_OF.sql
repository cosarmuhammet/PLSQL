-- Cursor - FOR UPDATE ve WHERE CURRENT OF kullanýmý
-- Maaþý 5000' den az olanlara %20 zam 

DECLARE
    CURSOR c_emp IS SELECT * FROM EMPLOYEES2 FOR UPDATE of SALARY; -- FOR UPDATE kullanma amacý veri tabanýnda iþlem yaparken diðer kullanýcýlar tarafýndan yapýlabilecek deðiþiklikleri engellemektir

BEGIN
    
    FOR r_emp IN c_emp LOOP
    
        IF r_emp.salary <= 5000 THEN
            DBMS_OUTPUT.PUT_LINE(r_emp.employee_id || ' Update edildi' );
            UPDATE employees2 SET
                salary = salary * 1.2
            --WHERE employee_id = r_emp.employee_id ;
            WHERE CURRENT OF c_emp; -- son okuduðu kaydý update edecek
            
        END IF;
    
    END LOOP;

    COMMIT;

END;