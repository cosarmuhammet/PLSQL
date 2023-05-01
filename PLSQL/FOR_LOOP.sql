-- FOR LOOP 

BEGIN

    FOR sayac IN  1..5 LOOP  --Tersten yazdýrmak için REVERSE eklenmeli (IN den sonra)
        
        EXIT WHEN sayac = 3; --Veya CONTINUE WHEN sayac=3; yazýlabilir. 3 olunca döngüden çýkmasý için
        dbms_output.put_line('Sayac = '||sayac);
    END LOOP;

END;
/

--Faktöriyel hesaplama
DECLARE
    faktoriyel number :=1;
    
BEGIN
    FOR sayac IN 1..5 LOOP
        faktoriyel := faktoriyel * sayac;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('5! = '||faktoriyel);

END;
/

-- NESTED LOOP (Ýçiçe LOOP)
-- BÖLÜMLER
--      ÇALIÞANLAR

DECLARE
    yonetici employees.last_name%type;
BEGIN
    
    FOR  d IN (SELECT department_id, department_name, manager_id FROM DEPARTMENTS ORDER BY department_id) LOOP
        
        
        BEGIN
            SELECT last_name INTO yonetici FROM EMPLOYEES WHERE employee_id = d.manager_id;
            EXCEPTION WHEN no_data_found THEN
                yonetici := null;
        END;
            
        DBMS_OUTPUT.PUT_LINE('Bölüm no : '|| d.department_id || ' Bölüm adý : '|| d.department_name || ' Yonetici : '|| yonetici);
        
        
        FOR e IN (SELECT employee_id, First_name, last_name FROM EMPLOYEES WHERE department_id = d.department_id) LOOP
            DBMS_OUTPUT.PUT_LINE('          Emp_id : '|| e.employee_id || ' First Name : '|| e.first_name || ' Last name :' || e.last_name);    
        END LOOP;
        
        
    END LOOP;


END;
/




