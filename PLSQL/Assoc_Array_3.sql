--Collection Data Types 1)Associative Array Index By Tables
-- �rnek : 1'den 10'a kadar say�lar�n karesini bulup ekrana yazd�rma
-- INDEX ve DE�ER, her ikisi de say�sal wkare(INDEX) := DE�ER
-- �rnek2 : INDEX tamsay�, DE�ER VARCHAR2 
-- �rnek3 : Her ikisi de Varhar2 wkare(Vars-char2) := Varchar2

DECLARE
    --1.Veri tipi tan�mlama
    TYPE t_assoc_num IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    wkare t_assoc_num;
    j number;
    --2.Veri tipi tan�mlama
    TYPE t_assoc_str IS TABLE OF employees.last_name%type INDEX BY PLS_INTEGER;
    wlast_name  t_assoc_str;
    --3.Veri tipi tan�mlama
    TYPE t_assoc_str2 IS TABLE OF jobs.job_title%type INDEX BY VARCHAR2(10);
    wjobs   t_assoc_str2;


BEGIN
    FOR i IN 1..10 LOOP
        wkare(i) := POWER(i,2); --karesini alm
    
    END LOOP;

    j := wkare.first;
    /*WHILE j IS NOT NULL LOOP
        dbms_output.put_line(j ||' karesi = '||wkare(j));
        j := wkare.next(j);
    
    END LOOP;*/
    
    
    j := 0;
    /*FOR I IN (SELECT last_name FROM employees WHERE ROWNUM <=10 ) LOOP --�LK 10 KAYIT
        j := j+1;
        wlast_name(j) := I.last_name;
        dbms_output.put_line('wlast_name('|| j || ') = '|| wlast_name(j) );    
    
    END LOOP;*/
    
    
    FOR I IN(SELECT job_id, job_title FROM jobs) LOOP
        wjobs(I.job_id) := I.job_title;
        dbms_output.put_line( 'wjobs(' || I.job_id || ') = '|| wjobs(I.job_id) );
    
    END LOOP;
    
    

END;