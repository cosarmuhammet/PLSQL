--Record Data Types   DEVELOPER DEFÝNED RECORDS
--ör3: Rehber uygulamasý

DECLARE
    TYPE r_kisi IS RECORD(
                         ad     employees.first_name%type,
                         soyad  employees.last_name%type
                         );
    
    TYPE contact IS RECORD(
                          kisi      r_kisi, --nested record
                          telefon   employees.phone_number%type
                          );
                          
    TYPE dizi IS TABLE OF contact;
                          
                          
    rehber dizi := dizi();
    j   number := 0;

BEGIN 
    
    FOR i IN (SELECT first_name, last_name, phone_number FROM employees WHERE DEPARTMENT_ID = 90) LOOP
    
        j := j+1;
        rehber.EXTEND;
        rehber(j).kisi.ad       := i.first_name;
        rehber(j).kisi.soyad    := i.last_name;
        rehber(j).telefon       := i.phone_number;
        
    END LOOP;
    
    j := rehber.FIRST;
    WHILE j IS NOT NULL LOOP
        dbms_output.put_line('Ad : '||rehber(j).kisi.ad || ' Soyad : '|| rehber(j).kisi.soyad || ' Telefon : '|| rehber(j).telefon);
        j := rehber.NEXT(j);
    END LOOP;
   
END;

