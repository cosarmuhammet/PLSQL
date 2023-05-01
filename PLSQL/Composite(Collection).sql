-- COMPOSITE (Collection) Data types (record type örneði)
-- Senaryo : DEPARTMENTS Tablosundan, DEPARTMENT_ID'si 10 olan kaydý ekrana listeleyelim

DECLARE
  
    --Tablo üzerinde sonradan degisme ihtimali icin(Uzunluklarýn):
    /*WDEPARTMENT_ID     DEPARTMENTS.DEPARTMENT_ID%TYPE;    
    WDEPARTMENT_NAME   DEPARTMENTS.DEPARTMENT_NAME%TYPE; 
    WMANAGER_ID        DEPARTMENTS.MANAGER_ID%TYPE;    
    WLOCATION_ID       DEPARTMENTS.LOCATION_ID%TYPE; */
    
    --r_dept DEPARTMENTS%ROWTYPE;
    
    TYPE t_dept IS RECORD( dept_id number(4),
                           dept_name departments.department_name%type,
                           manager_id departments.manager_id%type
                         );
    r_dept2 t_dept; --Veri tipi kendi tanýmladýðýmýz type oldu
    
BEGIN
    
    /*SELECT * INTO WDEPARTMENT_ID, WDEPARTMENT_NAME, WMANAGER_ID , WLOCATION_ID
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = 10;*/
    
    --SELECT * INTO r_dept FROM DEPARTMENTS WHERE DEPARTMENT_ID = 20;
    
    --DBMS_OUTPUT.PUT_LINE(WDEPARTMENT_ID||' '|| WDEPARTMENT_NAME||' '|| WMANAGER_ID||' '|| WLOCATION_ID);
    
    --DBMS_OUTPUT.PUT_LINE(r_dept.DEPARTMENT_ID||' '|| r_dept.DEPARTMENT_NAME||' '|| r_dept.MANAGER_ID||' '|| r_dept.LOCATION_ID);
    
    SELECT department_id, department_name, manager_id INTO r_dept2 FROM DEPARTMENTS WHERE DEPARTMENT_ID = 30;
    
    DBMS_OUTPUT.PUT_LINE(r_dept2.dept_id ||' '|| r_dept2.dept_name ||' '|| r_dept2.manager_id);
    
END;


