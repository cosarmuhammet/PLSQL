-- %TYPE -- %ROWTYPE
-- Senaryo : DEPARTMENTS Tablosundan, DEPARTMENT_ID'si 10 olan kayd� ekrana listeleyelim.

DECLARE
    --WDEPARTMENT_ID     NUMBER(4);    
    --WDEPARTMENT_NAME   VARCHAR2(30);
    --WMANAGER_ID        NUMBER(6);   
    --WLOCATION_ID       NUMBER(4);
    
    --Tablo �zerinde sonradan degisme ihtimali icin(Uzunluklar�n):
    /*WDEPARTMENT_ID     DEPARTMENTS.DEPARTMENT_ID%TYPE;    
    WDEPARTMENT_NAME   DEPARTMENTS.DEPARTMENT_NAME%TYPE; 
    WMANAGER_ID        DEPARTMENTS.MANAGER_ID%TYPE;    
    WLOCATION_ID       DEPARTMENTS.LOCATION_ID%TYPE; */
    
    r_dept DEPARTMENTS%ROWTYPE;
    
BEGIN
    
    /*SELECT * INTO WDEPARTMENT_ID, WDEPARTMENT_NAME, WMANAGER_ID , WLOCATION_ID
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID = 10;*/
    
    SELECT * INTO r_dept FROM DEPARTMENTS WHERE DEPARTMENT_ID = 10;
    
    --DBMS_OUTPUT.PUT_LINE(WDEPARTMENT_ID||' '|| WDEPARTMENT_NAME||' '|| WMANAGER_ID||' '|| WLOCATION_ID);
    
    DBMS_OUTPUT.PUT_LINE(r_dept.DEPARTMENT_ID||' '|| r_dept.DEPARTMENT_NAME||' '|| r_dept.MANAGER_ID||' '|| r_dept.LOCATION_ID);
    
END;