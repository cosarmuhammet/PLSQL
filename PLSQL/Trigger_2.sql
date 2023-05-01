CREATE OR REPLACE PROCEDURE DML_guvenlik_kontrol IS
BEGIN
      IF TO_CHAR (sysdate, 'HH24:MI') not between '08:00' and '18:00'
          or TO_CHAR (sysdate, 'DY') IN ('SAT', 'SUN', 'CMT', 'PAZ')
          THEN
          RAISE_APPLICATION_ERROR(-20205,'Mesai saatleri disinda veri isleme yapilamaz!');
    END IF;
END;

/
---------------------------------
CREATE OR REPLACE TRIGGER DML_DEPARTMENTS
BEFORE INSERT OR UPDATE OR DELETE ON DEPARTMENTS
BEGIN
    dml_guvenlik_kontrol;
END;
/

CREATE OR REPLACE TRIGGER DML_JOBS
BEFORE INSERT OR UPDATE OR DELETE ON DEPARTMENTS
BEGIN
    dml_guvenlik_kontrol;
END;
/

--GEÇÝCÝ OLARAK TRÝGGERI DEVRE DIÞI BIRAKMA

ALTER TRIGGER dml_jobs DISABLE;
/
ALTER TRIGGER dml_jobs ENABLE;
/
--

UPDATE JOBS SET JOB_TITLE = 'Programcý'
WHERE JOB_ID = 'IT_PROG';
/