-- Stored Procedures
-- �rnek1 : Merhaba D�nya yazd�ran procedure

CREATE OR REPLACE PROCEDURE merhabaDunya  IS  --Stored Procedure Olu�turma
BEGIN 
    dbms_output.put_line('Merhaba D�nya! -Procedure');
END;

/

EXECUTE merhabadunya;  --�al��t�rma