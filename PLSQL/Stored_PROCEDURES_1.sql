-- Stored Procedures
-- Örnek1 : Merhaba Dünya yazdýran procedure

CREATE OR REPLACE PROCEDURE merhabaDunya  IS  --Stored Procedure Oluþturma
BEGIN 
    dbms_output.put_line('Merhaba Dünya! -Procedure');
END;

/

EXECUTE merhabadunya;  --Çalýþtýrma