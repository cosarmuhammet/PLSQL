-- Nested Tables
-- Örnek2 : Personel isimlerini bir dizide tutma

DECLARE
    
    CURSOR c_employees IS SELECT first_name,last_name,job_id FROM employees;
    
    TYPE ndt_list IS TABLE OF employees.first_name%type;
    
    
    name_list   ndt_list := ndt_list(); -- Kurucu metod Constructor
    counter INTEGER := 0;
    
BEGIN
   
    FOR n IN c_employees LOOP
        COUNTER := COUNTER + 1;
        name_list.extend;
        name_list(counter) := n.first_name ||' '|| n.last_name ;
        
        dbms_output.put_line(' Employees(' || counter || '): ' || name_list(counter) );
   
    END LOOP;
   
   

END; 