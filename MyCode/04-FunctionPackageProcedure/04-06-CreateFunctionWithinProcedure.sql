CREATE OR REPLACE PROCEDURE calc_employee_paycheck(emp_id IN NUMBER) 
as
    emp_rec employees%ROWTYPE;
    paycheck_total NUMBER;
    -- function for state tax
FUNCTION calc_state (sal IN NUMBER)
    RETURN NUMBER 
IS
BEGIN
    RETURN sal * .08;
END;
-- function for federal tax
FUNCTION calc_federal (sal IN NUMBER)
    RETURN NUMBER 
IS
BEGIN
    RETURN sal * .12;
END;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Calculating paycheck with taxes');
    SELECT * INTO emp_rec FROM employees WHERE employee_id = emp_id;
    
    paycheck_total := emp_rec.salary - calc_state(emp_rec.salary) -
    calc_federal(emp_rec.salary);
    DBMS_OUTPUT.PUT_LINE('The paycheck total for ' || emp_rec.last_name || ' is ' || paycheck_total);
EXCEPTION
WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'No matching employee for the given ID');
END;
/
DBMS_OUTPUT.ENABLE;
calc_employee_paycheck(100);