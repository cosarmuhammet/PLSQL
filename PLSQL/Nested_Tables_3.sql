-- Nested Tables
-- Örnek3 : Personel isim-soyisim-JOB_ID bir dizide tutma

DECLARE
    
    CURSOR c_employees IS SELECT first_name, last_name, job_id FROM employees;
    
    TYPE ndt_list IS TABLE OF c_employees%rowtype; --type'larý employees tablosuyla ayný yapma
    
    name_list   ndt_list := ndt_list(); -- Kurucu metod Constructor
    counter INTEGER := 0;
    
BEGIN
   
    FOR n IN c_employees LOOP
        COUNTER := COUNTER + 1;
        name_list.extend;
        name_list(counter).first_name := n.first_name ;		--dizi 1. index
        name_list(counter).last_name := n.last_name ; 		--dizi 2.index
        name_list(counter).job_id := n.job_id ; 			--dizi3. index
        
        dbms_output.put_line(' Employees(' || counter || '): ' || name_list(counter).first_name ||'  '||
								name_list(counter).last_name ||'       JOB_ID: '|| name_list(counter).job_id );
   
    END LOOP;
   
END; 
