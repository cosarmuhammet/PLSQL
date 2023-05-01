-- Package tanýmlama bölümü
-- Çok kullanýlan nesnelerin tanýmlandýðý bir package örneði

CREATE OR REPLACE PACKAGE myTypes  AS
    
    TYPE empData IS RECORD ( 
        emp_id  employees.employee_id%type,
        f_name  employees.first_name%type        
        );
    
    PI CONSTANT NUMBER (3,2) := 3.14;  --Tüm pakette geçerli deðiþtirilmeyecek tanýmlama
    
    
    TYPE cursor_type IS REF CURSOR;
    
    myException EXCEPTION;
    
    
    
END myTypes;