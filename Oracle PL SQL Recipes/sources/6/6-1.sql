DECLARE
  in_dollars	     VARCHAR2(10) := &dollars;
  dollars_formatted  NUMBER;
BEGIN
  -- Assume that IN_DOLLARS is the user input in VARCHAR2 format
  DBMS_OUTPUT.PUT_LINE(dollars_formatted);
/