-- Pseudocoluns Kullanýmý (Currval, Nextval) (Sequence)

desc regions;
/
select * from regions;
/
CREATE SEQUENCE test_seq START WITH 5 INCREMENT BY 1 ; --5'TEN BAÞLIYIP 1er ARTSIN.
/

DECLARE
    seq_num number;


BEGIN

    seq_num := test_seq.nextval;
    INSERT INTO REGIONS (REGION_ID, REGION_NAME)
                VALUES(seq_num, 'Avustralya');
    
    seq_num := test_seq.currval;
    UPDATE REGIONS SET region_name = 'Antartika' 
    WHERE region_id = seq_num;
    
    commit;

END;


