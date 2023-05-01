-- BLOB Uygulamasý
-- Resim dosyalarýný BLOB kolona sahip tabloya insert etme

/
CREATE TABLE RESIMLER(
                        dosyaAdi VARCHAR2(100) PRIMARY KEY,
                        resim BLOB );
/                        

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
-------------PROCEDURE-------------
CREATE OR REPLACE PROCEDURE file_to_blob 
(
        p_dir   IN varchar2,
        p_dosyaIsmi    varchar2
) IS
        wfoto         BFILE;
        wtempdata     BLOB;
        wKaynakOffset PLS_INTEGER := 1;
        whedefOffset  PLS_INTEGER := 1;
BEGIN
    
    dbms_lob.CreateTemporary( wtempdata, true); --Geçici bir alan oluþturma
    wfoto := BFilename( p_dir , p_dosyaIsmi);
    dbms_lob.FileOpen( wfoto, dbms_lob.FILE_READONLY);
    dbms_lob.LoadFromFile( wtempdata, wfoto , dbms_lob.LOBMAXSIZE, whedefOffset, wKaynakOffset);


    INSERT INTO RESIMLER (dosyaAdi, resim) values ( p_dosyaIsmi, wtempdata);
    commit ;
    
    dbms_lob.FileClose( wfoto );


END;
/
----------PROCEDURE ÇALIÞTIRMA-----------
EXECUTE file_to_blob('IMAGE_DIR', 'gul.jpeg');
EXECUTE file_to_blob('IMAGE_DIR', 'btkakademi_logo.png');
EXECUTE file_to_blob('IMAGE_DIR', 'plsql.png');
   
/
SELECT * FROM RESIMLER;


