-- Iterative Control Statements - BASIC LOOP

SET SERVEROUTPUT ON;
/
DECLARE
    sayac   binary_integer := 0 ;

BEGIN
    
    LOOP
        sayac := sayac + 1;
        
        IF mod(sayac, 2) = 0 THEN --Tek sayýlarý yazdýrma 1.yol
            continue;
        END IF;
        
        --continue when mod(sayac,2) = 0 ;  2.yol 
        
        
        dbms_output.put_line('Sayac = '|| sayac);
        
       /* IF sayac = 5 THEN -- loop sýnýrlama 1.yol
            exit;
        END IF;*/
        
        exit WHEN sayac = 5 ; --2.yol
        
        
    END LOOP;

END; 

/






