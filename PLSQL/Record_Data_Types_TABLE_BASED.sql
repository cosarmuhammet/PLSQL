--Record Data Types - Table-Based Records
-- �r: En y�ksek maa� alan ki�inin isim,soyisim, maa�� , i�i

DECLARE
    calisanlar  employees%ROWTYPE;


BEGIN
    SELECT * INTO calisanlar FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

    dbms_output.put_line('�smi : '||calisanlar.first_name);
    dbms_output.put_line('Soyismi : '||calisanlar.last_name);
    dbms_output.put_line('Maas : '||calisanlar.salary);
    dbms_output.put_line('Job : '||calisanlar.job_id);

END;
