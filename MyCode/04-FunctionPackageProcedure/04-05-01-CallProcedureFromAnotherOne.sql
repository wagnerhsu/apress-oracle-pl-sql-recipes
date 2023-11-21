CREATE OR REPLACE PROCEDURE grant_raises (pct_increase IN NUMBER,
                                          upper_bound IN NUMBER) 
as
    CURSOR emp_cur is
        SELECT employee_id, first_name, last_name FROM employees;
 
BEGIN
    -- loop through each record in the employees table
    FOR emp_rec IN emp_cur 
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.first_name || ' ' || emp_rec.last_name);
        increase_wage(emp_rec.employee_id, pct_increase, upper_bound);
    END LOOP;
END;
/

DBMS_OUTPUT.ENABLE;
grant_raises(1, 5000);