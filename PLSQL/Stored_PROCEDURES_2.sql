-- Stored Procedures
-- Örnek2 : Departments tablosuna haftasonlarý kayýt giriþini engelleme

CREATE OR REPLACE PROCEDURE ins_dept (
                                     p_dno   IN number,
                                     p_name  IN VARCHAR2,
                                     p_man   IN departments.manager_id%type,
                                     p_loc   IN departments.location_id%type,
                                     p_sonuc OUT  VARCHAR2
                                     ) IS
BEGIN 
    
    IF TO_CHAR(SYSDATE, 'DY') IN ('CMT', 'PAZ') THEN
        p_sonuc := 'Cumartesi ve Pazar gunleri kayýt girilemez.';
        
    ELSE
        BEGIN
            INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
            VALUES (p_dno, p_name, p_man, p_loc);
            p_sonuc := 'Kayýt yapýldý' ;
        
            EXCEPTION WHEN OTHERS THEN
            p_sonuc := sqlcode || ' ' || sqlerrm;
        END;
    END IF;
    
END;

/
-------------------------------------------
-- Çalýþtýrma kýsmý--

DECLARE
    wsonuc VARCHAR2(300);
BEGIN
    ins_dept(280, 'Egitim', '145', 1700, WSONUC );
    dbms_output.put_line( wsonuc );
    
END;


