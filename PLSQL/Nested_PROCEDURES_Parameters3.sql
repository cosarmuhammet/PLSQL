 -- Nested Procedures
 -- Örnek5 : Parametre gönderme yöntemleri
 --Pozisyon notasyonu, isim notasyonu, karýþýk notasyon
 
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
    
    FOR I IN (SELECT employee_id FROM employees) LOOP
    
        --get_info(I.employee_id , wmaas, wmaas_zamli ); --Pozisyon Notasyonuna göre çaðýrma
        --get_info(p_id => I.employee_id , p_salary => wmaas, p_new_salary => wmaas_zamli ); -- Ýsim notasyonuna göre çaðýrma
        get_info(I.employee_id ,wmaas, p_new_salary => wmaas_zamli ); --Karýþýk Notasyon
        
        dbms_output.put_line('Sicil No : '|| I.employee_id || ' Mevcut maas: ' || wmaas || ' Zamli maas: '||wmaas_zamli);
        wmaas_zamli := 1.25;
        
    END LOOP;
 
   --get_info(145 , wmaas, wmaas_zamli );
   --dbms_output.put_line('Sicil No : '|| 145 || ' Mevcut maas: ' || wmaas || ' Zamli maas: '||wmaas_zamli);
 
 
END;
