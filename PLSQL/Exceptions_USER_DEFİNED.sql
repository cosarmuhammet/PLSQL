-- User Defined Exceptions
-- Örnek: Bölüme göre çalýþan personel sayýsýný veren PL/SQL programý


DECLARE

    v_dept_id       employees.department_id%type;
    v_toplam        number;

    e_invalid_id    EXCEPTION;

BEGIN
    
    v_dept_id := &dept_id; -- Kullanýcýdan giriþ alma

    IF v_dept_id > 0 THEN
            SELECT count(*) INTO v_toplam FROM EMPLOYEES WHERE department_id = v_dept_id;
            dbms_output.put_line(' Toplam: ' || v_toplam );
    ELSE
        RAISE e_invalid_id;  -- Exception'a yönlendirme
    END IF;


    EXCEPTION WHEN e_invalid_id THEN
        dbms_output.put_line(' Bolum No Negatif Olamaz!  ');
  

END;