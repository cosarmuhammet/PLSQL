-- Collection Data Types - Nested Tables
-- Örnek1 : Öðrenci ve Sýnav puanýný bir dizide tutma

DECLARE

    TYPE ndt_isimler IS TABLE OF VARCHAR2(10);
    TYPE ndt_puanlar IS TABLE OF INTEGER;
    
    isimler ndt_isimler;
    puanlar ndt_puanlar;
    
BEGIN
    
    isimler := ndt_isimler('Ali', 'Ahmet', 'Ayse', 'Fatma', 'Oguz');  -- deger atama
    puanlar := ndt_puanlar(98, 90, 38, 66, 96);
    
    dbms_output.put_line(' Toplam ogrenci sayisi : '|| isimler.count );
    
    FOR I IN 1..isimler.count LOOP
        dbms_output.put_line('Ogrenci : ' || isimler(i) || ' Puan : ' || puanlar(i));
        
    END LOOP;

END; 