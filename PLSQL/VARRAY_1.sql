-- Collection Data Types - VARRAY
--Örnek 1 : Futbol takımlarının isimlerini ve sıralamalarını bir dizide tutalım

DECLARE

    TYPE takimlar IS VARRAY(10) OF VARCHAR2(30); -- Type tanımlama
    takim   takimlar := takimlar('BJK', 'GS', 'FB', 'TS'); --Kurucu metod
    
BEGIN

    dbms_output.put_line('2000');
    dbms_output.put_line('--------');
    
    FOR i IN 1..takim.count LOOP
        dbms_output.put_line(i ||'.'|| takim(i));
    
    END LOOP;

END;

