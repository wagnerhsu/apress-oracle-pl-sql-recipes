DBMS_OUTPUT.ENABLE();
DECLARE
TYPE dow_type
IS
    VARRAY(7) OF VARCHAR2(3);
    dow dow_type := dow_type ();
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
    dow.EXTEND();
    dow(1) := 'Sun';
    dow.EXTEND();
    dow(2):= 'Mon';
    dow.EXTEND();
    dow(3):= 'Tue';
    dow.EXTEND();
    dow(4):= 'Wed';
    dow.EXTEND();
    dow(5):='Thu';
    dow.EXTEND();
    dow(6):= 'Fri';
    dow.EXTEND();
    dow(7):= 'Sat';
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