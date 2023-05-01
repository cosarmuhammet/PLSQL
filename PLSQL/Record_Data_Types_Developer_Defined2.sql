--Record Data Types   DEVELOPER DEF�NED RECORDS
--�r: Rehber uygulamas�

DECLARE
    TYPE r_isim IS RECORD(
                         ad     employees.first_name%type,
                         soyad  employees.last_name%type
                         );
    
    TYPE contact IS RECORD(
                          isim      r_isim, --nested record
                          telefon   employees.phone_number%type
                          );
                          
                          
    rehber contact;

BEGIN 

    rehber.isim.ad := 'Ali';
    rehber.isim.soyad := 'G�L';
    rehber.telefon  := '12345';

    dbms_output.put_line('Ad� : '|| rehber.isim.ad || ' Soyadi : '|| rehber.isim.soyad||
                         ' Telefon : '|| rehber.telefon);

END;