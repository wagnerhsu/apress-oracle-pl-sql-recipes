DECLARE
TYPE dow_type
IS
    VARRAY(7) OF VARCHAR2(3);
    dow dow_type := dow_type ('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
PROCEDURE log(l VARCHAR2)
IS
BEGIN
    PRINT(l);
END;
PROCEDURE dump(v_array dow_type) 
IS
BEGIN
    FOR i IN 1..dow.COUNT
    LOOP
        LOG(dow(i));
    END LOOP;
END;
BEGIN
    dump(dow);
    dow(2) := NULL;
    dump(dow);
    FOR i IN dow.FIRST..dow.LAST 
    LOOP
    	IF (dow(i) IS NOT NULL) THEN
        log(i || ':' || dow(i));
        END IF;
    END LOOP;
    
END;
/