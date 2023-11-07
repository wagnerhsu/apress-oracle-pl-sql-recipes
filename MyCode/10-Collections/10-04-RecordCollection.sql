DBMS_OUTPUT.ENABLE();
DECLARE
    CURSOR  driver IS
        SELECT  * FROM employees;

TYPE emp_type
IS
    TABLE OF driver%ROWTYPE INDEX BY BINARY_INTEGER;
    recs emp_type;
    total number := 0.0;
BEGIN
    OPEN DRIVER;
    FETCH DRIVER BULK COLLECT INTO recs;
    
    CLOSE DRIVER;
    DBMS_OUTPUT.PUT_LINE (recs.COUNT || ' records found');
    FOR i IN 1..recs.COUNT()
    LOOP
        pkg_common.prc_dump(i||':'||recs(i).first_name);
    END LOOP;
    FOR i in 1..recs.COUNT
    LOOP
        total := total + recs(i).salary;
    END LOOP;
    pkg_common.prc_dump(total);
END;
/