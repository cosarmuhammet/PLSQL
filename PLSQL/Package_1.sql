-- Package tan�mlama b�l�m�
-- �ok kullan�lan nesnelerin tan�mland��� bir package �rne�i

CREATE OR REPLACE PACKAGE myTypes  AS
    
    TYPE empData IS RECORD ( 
        emp_id  employees.employee_id%type,
        f_name  employees.first_name%type        
        );
    
    PI CONSTANT NUMBER (3,2) := 3.14;  --T�m pakette ge�erli de�i�tirilmeyecek tan�mlama
    
    
    TYPE cursor_type IS REF CURSOR;
    
    myException EXCEPTION;
    
    
    
END myTypes;