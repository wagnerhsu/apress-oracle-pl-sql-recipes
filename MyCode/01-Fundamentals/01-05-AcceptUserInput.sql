DECLARE
    emp_count NUMBER;
    emp_name  VARCHAR2(25) := '&emp_name';
BEGIN
    SELECT count(*)
      INTO 
           emp_count
      FROM employees
     WHERE department_id = 
           &department_id;
     
    DBMS_OUTPUT.PUT_LINE(emp_count);
    DBMS_OUTPUT.PUT_LINE('emp_name:' || emp_name);
END;
/