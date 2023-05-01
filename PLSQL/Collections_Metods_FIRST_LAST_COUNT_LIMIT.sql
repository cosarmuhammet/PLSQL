-- Collections Metods FIRST - LAST - COUNT - LIMIT


DECLARE
    
    TYPE varray_type IS VARRAY(10) OF NUMBER;
    varray  varray_type := varray_type(1,2,3,4,5,6);
    
    PROCEDURE   yaz IS
    
    BEGIN
        dbms_output.put_line('varray.COUNT = '|| varray.COUNT); -- Eleman say�s�
        dbms_output.put_line('varray.LIMIT = '|| varray.LIMIT); -- Dizi boyutu
        dbms_output.put_line('varray.FIRST = '|| varray.FIRST); -- �lk eleman
        dbms_output.put_line('varray.LAST = '|| varray.LAST); --Son eleman
    END;


BEGIN
    dbms_output.put_line(' Orjinal de�erler --');
    yaz;

    varray.EXTEND(2,4);
    dbms_output.put_line(' EXTEND sonras� --');
    yaz;
    
    varray.TRIM(2);
    dbms_output.put_line(' TRIM sonras� --');
    yaz;
    
END;

