-- User Defined Exceptions
-- �rnek: B�l�me g�re �al��an personel say�s�n� veren PL/SQL program�


DECLARE

    v_dept_id       employees.department_id%type;
    v_toplam        number;

    e_invalid_id    EXCEPTION;

BEGIN
    
    v_dept_id := &dept_id; -- Kullan�c�dan giri� alma

    IF v_dept_id > 0 THEN
            SELECT count(*) INTO v_toplam FROM EMPLOYEES WHERE department_id = v_dept_id;
            dbms_output.put_line(' Toplam: ' || v_toplam );
    ELSE
        RAISE e_invalid_id;  -- Exception'a y�nlendirme
    END IF;


    EXCEPTION WHEN e_invalid_id THEN
        dbms_output.put_line(' Bolum No Negatif Olamaz!  ');
  

END;