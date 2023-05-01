-- BASIC LOOP ör2
-- KURSLAR tablosuna 3 adet kayýt gireceðiz.

CREATE TABLE KURSLAR (
                      kurs_id   number(3),
                      kurs_adi  varchar2(50),
                      egitmen   varchar2(50),
                      baslangic_tarihi date,
                      bitis_tarihi     date);
/               
SELECT * FROM KURSLAR;
/
DELETE FROM KURSLAR;
commit;
/
DECLARE
    rec_kurs    KURSLAR%ROWTYPE;


BEGIN
    
    rec_kurs.egitmen := 'Mehmet ';
    rec_kurs.baslangic_tarihi := trunc(sysdate);
    rec_kurs.bitis_tarihi := rec_kurs.baslangic_tarihi + 4 ;
    
    
    LOOP
        rec_kurs.kurs_id := nvl(rec_kurs.kurs_id, 0) + 1;
        
        exit WHEN rec_kurs.kurs_id = 4 ;  -- döngüyü bitirme koþulu
    
        SELECT DECODE(rec_kurs.kurs_id, 1 , 'Oracle SQL',
                                        2 , 'PL/SQL',
                                        3, 'Oracle DBA')
        INTO rec_kurs.kurs_adi FROM DUAL;
        
        INSERT INTO KURSLAR (kurs_id, kurs_adi, egitmen, baslangic_tarihi, bitis_tarihi)
        VALUES (rec_kurs.kurs_id , rec_kurs.kurs_adi, rec_kurs.egitmen,
                rec_kurs.baslangic_tarihi, rec_kurs.bitis_tarihi);
    
        rec_kurs.baslangic_tarihi := rec_kurs.bitis_tarihi + 1;
        rec_kurs.bitis_tarihi := rec_kurs.baslangic_tarihi + 4;
    END LOOP;
    
    commit;


END;
/
                         
                      
                      