DECLARE
TYPE num_type
IS
    TABLE OF number INDEX BY BINARY_INTEGER;
    nums num_type;
    total number;
BEGIN
    pkg_common.prc_dump('Test');
    nums(1) := 127.56;
    nums(2) := 56.79;
    nums(3) := 295.34;
    -- We can also use the following method to interate
    FOR i IN nums.FIRST..nums.LAST 
    LOOP
        pkg_common.prc_dump(i||':'||nums[i]);
    END LOOP;
END;
/