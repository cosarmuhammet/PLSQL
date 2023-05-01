-- Collection Data Types - VARRAY
--�rnek 1 : Futbol tak�mlar�n�n isimlerini ve s�ralamalar�n� bir dizide tutal�m
-- �rnek 2: �rnek 1' deki diziyi geni�letelim, dizi de�erlerini de�i�tirelim.

DECLARE

    TYPE takimlar IS VARRAY(10) OF VARCHAR2(30); -- Type tan�mlama , Dizi
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

