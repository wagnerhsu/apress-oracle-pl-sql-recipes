DBMS_OUTPUT.ENABLE();
DECLARE
TYPE total_type
IS
    TABLE OF number INDEX BY VARCHAR(10);
    totals total_type;
    dept VARCHAR(10);
TYPE num_type
IS
    TABLE OF NUMBER INDEX BY INTEGER;
    nums num_type;
BEGIN
    totals['one'] := 1;
    totals['ane'] := 2;
    pkg_common.prc_dump('test');
    nums[3] := 1;
    nums[1] := 3;
    FOR i IN nums.FIRST..nums.LAST
    LOOP
        IF NOT nums.EXISTS(i) THEN 
            continue;
        END IF;
        pkg_common.prc_dump(i || ':' || nums[i]);
    END LOOP;
    dept := totals.FIRST;
    LOOP
        EXIT WHEN dept IS NULL;
        DBMS_OUTPUT.PUT_LINE (to_char (totals(dept), '999,999.00') || ' ' || dept);
        dept := totals.NEXT(dept);
    END LOOP;
END;