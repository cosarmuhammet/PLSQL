-- PL/SQL ��inde SQL komutlar�n�n kullan�m� (Dynamic SQL - DML - DCL)
--PL/SQL i�inde dinamik sql do�rudan kullan�lamaz , kullan�labilmesi i�in execute immediate komutu gerekir.

DECLARE

    ddl_komut varchar2(2000);

BEGIN
   -- ddl_komut := 'CREATE TABLE TEMP_TABLE (urun_id number(10), urun_adi varchar2(30) )';
    --ddl_komut := 'ALTER TABLE TEMP_TABLE ADD urun_fiyati number(15,2)';
    --ddl_komut := 'GRANT SELECT ON TEMP_TABLE TO MCOSAR ';
    --ddl_komut := 'REVOKE SELECT ON TEMP_TABLE FROM MCOSAR';
    ddl_komut := 'DROP TABLE TEMP_TABLE';
    
    EXECUTE IMMEDIATE ddl_komut; 
    
    
    --dbms_output.put_line('Tabla olu�turuldu.');
    --dbms_output.put_line('Tabla ALTER edildi.');


END;
/
desc temp_table;
/






