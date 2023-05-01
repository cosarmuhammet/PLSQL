--Record Data Types - Cursor-Based Records
-- �r: Ortalama maa�tan daha d���k maa� alanlar

DECLARE
    CURSOR c_oku IS SELECT employee_id, first_name, last_name, job_id , salary FROM employees
    WHERE salary < (SELECT AVG(SALARY) FROM employees );

    calisan     c_oku%rowtype;

BEGIN
    SELECT AVG(SALARY) INTO calisan.SALARY FROM employees;
    dbms_output.put_line('ORTALAMA MAAS : '|| calisan.SALARY);
    
    OPEN c_oku;
        LOOP
            FETCH c_oku INTO calisan;  --CURSORDAN B�LG� OKUMA
            EXIT WHEN c_oku%NOTFOUND;  --D�ng�den ��kma �art�
            
            dbms_output.put_line('Calisan : ' || calisan.employee_id ||' '|| calisan.first_name ||' '|| calisan.last_name 
                                     ||' '|| calisan.job_id||' '|| calisan.salary || chr(10));
        END LOOP;
        
        
    CLOSE c_oku;
    

END;
