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
    i INT;
BEGIN
    totals('one') := 1;
    totals('ane') := 2;
    pkg_common.prc_dump('test');
    nums(3) := 1;
    nums(1) := 3;
    pkg_common.prc_dump(nums.COUNT);
    i := nums.FIRST;
    LOOP
        EXIT WHEN i IS NULL;
        pkg_common.prc_dump('i:'|| nums(i));
        i := nums.NEXT(i);
    END LOOP;
    dept := totals.FIRST;
    LOOP
        EXIT WHEN dept IS NULL;
        DBMS_OUTPUT.PUT_LINE (to_char (totals(dept), '999,999.00') || ' ' || dept);
        dept := totals.NEXT(dept);
    END LOOP;
    pkg_common.prc_dump('Use for...in');
    FOR j IN nums.FIRST..nums.LAST 
    LOOP
        pkg_common.prc_dump(j);
    END LOOP;
    -- FOR..IN只适合索引连续的Collection，不适合以字符串以索引的Collection
END;