DECLARE
    hours NUMBER;
BEGIN
    hours:=CALC_QUARTER_HOUR(3.4);
    dbms_output.put_line(hours);
END;
/