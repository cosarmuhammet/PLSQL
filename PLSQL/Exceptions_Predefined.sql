-- Predefined Exceptions
-- �rnek

DECLARE

    rec_emp     employees%rowtype;
    
    val1    number(5);

BEGIN

    val1 := 5000/0;
    val1 := 123456;

    SELECT * INTO rec_emp FROM employees ;   --WHERE employee_id = 1;
    
    dbms_output.put_line(rec_emp.employee_id ||' ' || rec_emp.first_name);


    EXCEPTION WHEN NO_DATA_FOUND THEN
            dbms_output.put_line(' 1 nolu kay�t yok' || sqlcode || ' ' || sqlerrm);
        
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line(' 1 den fazla kay�t d�n�yor' || sqlcode || ' ' || sqlerrm);
        WHEN VALUE_ERROR THEN
            dbms_output.put_line(' Yanlis deger ' || sqlcode || ' ' || sqlerrm);
        WHEN ZERO_DIVIDE THEN
            dbms_output.put_line(' S�f�ra bolme yap�lamaz' || sqlcode || ' ' || sqlerrm);

END;
