
-- BLOB Uygulamasý (File sistemden veritabanýna resim aktaran PL/SQL uygulamasý)
-- C:\RESIMLER gul.jpeg, plsql.png, btkakademi_logo.png

/*Ýlk adýmda sys üzerinden directory oluþturulup , hr kullanýcýsýna yetki veriliyor.
CREATE DIRECTORY IMAGE_DIR as 'c:\RESIMLER';
grant read, write on directory IMAGE_DIR to HR;
*/

CREATE TABLE RESIMLER(
                        dosyaAdi VARCHAR2(100) PRIMARY KEY,
                        resim BLOB );
                        
                        
DECLARE
    foto         BFILE;
    tempdata     BLOB;
    KaynakOffset PLS_INTEGER := 1;
    hedefOffset  PLS_INTEGER := 1;
    dosyaIsmi    VARCHAR2(30) := 'btkakademi_logo.png';

BEGIN
    dbms_lob.CreateTemporary( tempdata, true);
    foto := BFilename('IMAGE_DIR', dosyaIsmi);
    dbms_lob.FileOpen(foto, dbms_lob.FILE_READONLY);
    dbms_lob.LoadFromFile(tempdata, foto , dbms_lob.LOBMAXSIZE, hedefOffset, KaynakOffset);

    INSERT INTO RESIMLER (dosyaAdi, resim) values (dosyaIsmi, tempdata);
    commit ;
    
    dbms_lob.FileClose(foto);
    
END;
