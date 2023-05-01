-- DML TRIGGERS
-- REGIONS tablosu üzerinde yapýlan DML iþlemlerinin(INSERT,UPDATE,DELETE)
--Log kayýtlarýný tutma

---KAYITLARIN TUTULDUGU YENÝ BÝR TABLO OLUSTURULDU
CREATE TABLE REGIONS_LOG (
    region_id   number,
    region_name varchar2(25),
    kim         varchar2(30),
    nezaman     date,
    neyapti     varchar2(10)
    );
    
/
-----------TRIGGER

CREATE OR REPLACE TRIGGER regions_audit_trg
    AFTER INSERT OR UPDATE OR DELETE ON REGIONS
FOR EACH ROW
DECLARE
    wislem VARCHAR2(10);
BEGIN
    wislem := CASE
        WHEN INSERTING THEN 'INSERT'
        WHEN UPDATING THEN 'UPDATE'
        WHEN DELETING THEN 'DELETE'
        END;

    IF INSERTING THEN
        INSERT INTO regions_log (region_id, region_name, kim, nezaman, neyapti)
            VALUES (:NEW.region_id, :NEW.region_name, USER, SYSDATE, wislem);
    END IF;

    IF UPDATING THEN
        INSERT INTO regions_log (region_id, region_name, kim, nezaman, neyapti)
            VALUES (:OLD.region_id, :OLD.region_name, USER, SYSDATE, wislem);

        INSERT INTO regions_log (region_id, region_name, kim, nezaman, neyapti)
            VALUES (NVL(:NEW.region_id, :OLD.region_id),
                    NVL(:NEW.region_name, :OLD.region_name),
                    USER, SYSDATE, wislem);
    END IF;

    IF DELETING THEN
        INSERT INTO regions_log (region_id, region_name, kim, nezaman, neyapti)
            VALUES (:OLD.region_id, :OLD.region_name, USER, SYSDATE, wislem);
    END IF;
END;
/

---------------------------TEST

select * from regions_log;
select * from regions;
INSERT INTO REGIONS VALUES (5, 'Avustralya');
commit;
UPDATE REGIONS SET region_name = 'Australia'
WHERE region_id = 5;
delete from regions where region_id = 5;



