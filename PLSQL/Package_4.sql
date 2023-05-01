-- Package içinde tanýmlý nesnelerin PL/SQL bloklarýnda kullanýmý

CREATE OR REPLACE PACKAGE myTypes  AS
    
    TYPE empData IS RECORD ( 
        emp_id  employees.employee_id%type,
        f_name  employees.first_name%type        
        );
    
    PI CONSTANT NUMBER (3,2) := 3.14;  --Tüm pakette geçerli deðiþtirilmeyecek tanýmlama
    
    TYPE cursor_type IS REF CURSOR;
    
    myException EXCEPTION;
    
    
    PROCEDURE calisanlar( p_dept_id employees.department_id%type );
    
    FUNCTION daireAlani ( r number ) RETURN number;  

END myTypes;
/
---------------------------------------------------------------------
-- PACKAGE BODY

CREATE OR REPLACE PACKAGE BODY myTypes AS
---------------------------------------------------------------------
    PROCEDURE calisanlar( p_dept_id employees.department_id%type ) IS
        wempdata    myTypes.empData;
        c_cursor    myTypes.cursor_type;
    BEGIN
        OPEN c_cursor FOR SELECT employee_id,first_name FROM employees 
                            WHERE department_id = p_dept_id;
    
        LOOP
            FETCH c_cursor INTO wempdata;
            EXIT WHEN c_cursor%NOTFOUND;
        
            dbms_output.put_line(wempData.emp_id || ' ' || wempData.f_name);
        END LOOP;
    
        CLOSE c_cursor;
    END;
-----------------------
    FUNCTION daireAlani ( r number ) RETURN number IS
        wsonuc number;
    BEGIN
        wsonuc := myTypes.PI * POWER(r,2);
        RETURN (wsonuc);
    END;

END myTypes;
/
---------------------------------------------------------------------

-- Paket içindeki procedure çalýþtýrma
EXECUTE myTypes.calisanlar(60);
/
-- Paket içindeki fonksiyon çalýþtýrma
SELECT myTypes.daireAlani(5) FROM DUAL;
/


