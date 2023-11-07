DBMS_OUTPUT.ENABLE();
DECLARE
TYPE rec_type 
IS 
    RECORD 
    (
        last_name  varchar2(25),
        department varchar2(30),
        salary     number );
    rec rec_type;
begin
    rec.last_name  := 'Juno';
    rec.department := 'IT';
    rec.salary     := '5000';
    pkg_common.prc_dump(rec.last_name);
    pkg_common.prc_dump(rec.department);
END;
/