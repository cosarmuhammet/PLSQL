-- WHILE LOOP 
--Belirli bir tarihin ve sonraki günlerin isimlerini ekrana yazdýrma
-- ör: 26.Aðustos.1071 hangi gün idi ?


DECLARE
    tarih1   date;
    tarih2   date;
BEGIN
    tarih1 := TO_DATE('26/08/1071', 'DD/MM/YYYY');
    tarih2 := LAST_DAY(tarih1);
    
    WHILE tarih1 <= tarih2 LOOP
        
            
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(tarih1, 'day') ||' '|| TO_CHAR(tarih1, 'DD/MM/YYYY'));
        tarih1 := tarih1 + 1 ;
    
    END LOOP;
    
    
END;

