 -- Nested Procedures
 -- Örnek : Parametreli Procedures (IN ,OUT ,IN OUT)
 
DECLARE

    wmaas       employees.salary%type;
    wmaas_zamli employees.salary%type := 1.25; --zam mýktarý
    PROCEDURE get_info (
                p_id            IN employees.employee_id%type,
                p_salary        OUT employees.salary%type,
                p_new_salary    IN OUT employees.salary%type )    IS
            BEGIN
                SELECT salary INTO p_salary FROM employees WHERE employee_id = p_id;
                p_new_salary := p_new_salary * p_salary;
                
            END;
 
 
BEGIN      --MAIN BLOCK
 
   get_info(145 , wmaas, wmaas_zamli );
   dbms_output.put_line('Sicil No : '|| 145 || ' Mevcut maas: ' || wmaas || ' Zamli maas: '||wmaas_zamli);
 
 
END;
