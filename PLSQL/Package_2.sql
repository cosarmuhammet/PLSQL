-- Package içinde tanýmlý nesnelerin PL/SQL bloklarýnda kullanýmý


CREATE OR REPLACE PACKAGE myTypes  AS
    
    TYPE empData IS RECORD ( 
        emp_id  employees.employee_id%type,
        f_name  employees.first_name%type        
        );
    
    PI CONSTANT NUMBER (3,2) := 3.14;  --Tüm pakette geçerli deðiþtirilmeyecek tanýmlama
    
    TYPE cursor_type IS REF CURSOR;
    
    myException EXCEPTION;
    
END myTypes;
/
------------------------------------------------------

DECLARE

    wempdata    myTypes.empData;
    c_cursor    myTypes.cursor_type;
    r           number := 5 ;

BEGIN
    
    OPEN c_cursor FOR SELECT employee_id,first_name FROM employees ORDER BY 1;
    
    LOOP
        FETCH c_cursor INTO wempdata;
        EXIT WHEN c_cursor%NOTFOUND;
        
        dbms_output.put_line(wempData.emp_id || ' ' || wempData.f_name);
    END LOOP;
    
    CLOSE c_cursor;
    
    dbms_output.put_line(r ||' Yarýcapli dairenin alani: ' ||myTypes.PI * POWER(r,2) );

END;