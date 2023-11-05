DECLARE
    string_value VARCHAR(50);
BEGIN
    string_value :=rpad('test',20);
    PRINT '[' || string_value || ']';
    string_value :=lpad('test',20);
    PRINT '[' || string_value || ']';
    string_value :=lpad('test',20,'*');
    PRINT '[' || string_value || ']';
END