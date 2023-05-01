-- PL/SQL Ýçinde SQL komutlarýnýn kullanýmý (Static SQL - DML - TCL)

DECLARE
    emp_id  employees2.employee_id%type;  --reference type
    emp_first_name employees2.first_name%type   := 'Muhammet';
    emp_last_name employees2.last_name%type     := 'Cosar';
    emp_job_id employees2.job_id%type           := 'PL/SQL';
BEGIN
    SELECT NVL(MAX(employee_id), 0) + 1 INTO emp_id FROM employees2;

    INSERT INTO employees2 (
        employee_id,
        first_name,
        last_name,
        job_id,
        email,
        hire_date
    ) VALUES (
        emp_id,
        emp_first_name,
        emp_last_name,
        emp_job_id,
        'abc@xyz.com',
        sysdate
    );

    UPDATE employees2 SET job_id = 'DBA' WHERE employee_id = emp_id;

    /*DELETE employees2 WHERE employee_id = emp_id 
    RETURNING employee_id, first_name, job_id INTO emp_id, emp_first_name, emp_job_id;*/

    --ROLLBACK;
    commit;

    dbms_output.put_line(emp_id ||' '|| emp_first_name ||' '|| emp_job_id);
END;



