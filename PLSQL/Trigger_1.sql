-- DML Triggers
-- Örnek1 : Mesai saatleri dýþýnda DML iþlemleri yapýlamasýn


CREATE OR REPLACE TRIGGER dml_departments
BEFORE INSERT OR UPDATE OR DELETE ON departments

BEGIN
    IF TO_CHAR(sysdate, 'HH24:MI') NOT BETWEEN '08:00' and '18:00'
        or TO_CHAR(sysdate, 'DY') IN ('CMT','PAZ') THEN
        RAISE_APPLICATION_ERROR(-20205, 'Mesai saatleri dýþýnda veri iþleme yapýlamaz!');
    END IF;
END;
/
-----------------------------------------------
DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID = 60;

