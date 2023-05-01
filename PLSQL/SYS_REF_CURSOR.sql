-- SYS_REFCURSOR (Ýmleçlerin Veri Tipi Olarak Kullanýlmasý)

DECLARE
    wimlec  SYS_REFCURSOR;
    wquery  VARCHAR2(1000);
    weskimaas   employees.salary%type;
    wyenimaas   employees.salary%type;

BEGIN

    wquery := 'SELECT salary, salary * 1.30 FROM employees WHERE department_id = 100';
    
    OPEN wimlec FOR wquery ;
    
        LOOP
            FETCH wimlec INTO weskimaas, wyenimaas;
            EXIT WHEN wimlec%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(' Eski Maas = ' || weskimaas || ' Yeni maas = ' || wyenimaas);
         
        
        END LOOP;
    
    CLOSE wimlec;

END;


