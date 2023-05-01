--Record Data Types   DEVELOPER DEF�NED RECORDS
--�r: Sistem zaman bilgilerini yazd�rma

DECLARE 
      TYPE r_zaman_type IS RECORD (
                                              curr_date DATE,
                                              curr_day VARCHAR2 (12),
                                              curr_time VARCHAR2 (8) := '00:00:00'
                                          );
      v_zaman r_zaman_type;
      
BEGIN
      SELECT sysdate INTO v_zaman.curr_date FROM DUAL;
      
      v_zaman.curr_day := TO_CHAR (v_zaman.curr_date, 'DAY');
      v_zaman.curr_time := TO_CHAR (v_zaman.curr_date, 'HH24:MI:SS');
      
      dbms_output.put_line ('Tarih:' || TO_CHAR (v_zaman.curr_date, 'DD/MM/YYYY'));
      dbms_output.put_line ('Gun:' || v_zaman.curr_day);
      dbms_output.put_line ('Zaman:' || v_zaman.curr_time);
END;