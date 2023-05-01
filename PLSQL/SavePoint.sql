-- PL/SQL ��inde SQL komutlar�n�n kullan�m� (Static SQL - DML- Savepoint - TCL)


DECLARE
    

BEGIN
    INSERT INTO REGIONS2 (region_id, region_name) VALUES (1,'Avrupa');
    SAVEPOINT A;
    
    INSERT INTO REGIONS2 (region_id, region_name) VALUES (2,'Asya');
    SAVEPOINT B;

    UPDATE REGIONS2 SET region_name = 'Asia' WHERE region_id = 2;
    SAVEPOINT C;
    
    DELETE FROM REGIONS2 WHERE region_id = 2;

    ROLLBACK TO A; -- a noktas�ndan sonraki t�m dml i�lemleerini rollback yapacak
    
    commit;

END;





