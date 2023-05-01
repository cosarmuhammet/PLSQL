-- Collection Data Types - VARRAY
--Örnek 1 : Futbol takýmlarýnýn isimlerini ve sýralamalarýný bir dizide tutalým
-- Örnek 2: Örnek 1' deki diziyi geniþletelim, dizi deðerlerini deðiþtirelim.

DECLARE

    TYPE takimlar IS VARRAY(10) OF VARCHAR2(30); -- Type tanýmlama , Dizi
    takim   takimlar := takimlar('BJK', 'GS', 'FB', 'TS'); --Kurucu metod
    
BEGIN

    dbms_output.put_line('2000');
    dbms_output.put_line('--------');
    
    
    FOR i IN 1..takim.count LOOP
        dbms_output.put_line(i ||'.'|| takim(i));
    
    END LOOP;
    
    takim.extend;
    takim(5) := 'AnkaraGucu' ;
    
    takim(3) := 'SivasSpor' ; 
    dbms_output.new_line;
    dbms_output.put_line('2001');
    dbms_output.put_line('--------');
    
    
    FOR i IN 1..takim.count LOOP
        dbms_output.put_line(i ||'.'|| takim(i));
    
    END LOOP;

END;

