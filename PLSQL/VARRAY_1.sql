-- Collection Data Types - VARRAY
--�rnek 1 : Futbol tak�mlar�n�n isimlerini ve s�ralamalar�n� bir dizide tutal�m

DECLARE

    TYPE takimlar IS VARRAY(10) OF VARCHAR2(30); -- Type tan�mlama
    takim   takimlar := takimlar('BJK', 'GS', 'FB', 'TS'); --Kurucu metod
    
BEGIN

    dbms_output.put_line('2000');
    dbms_output.put_line('--------');
    
    FOR i IN 1..takim.count LOOP
        dbms_output.put_line(i ||'.'|| takim(i));
    
    END LOOP;

END;

