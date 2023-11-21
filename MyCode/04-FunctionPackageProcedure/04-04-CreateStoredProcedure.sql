CREATE OR REPLACE PROCEDURE INCREASE_WAGE (empno_in IN NUMBER,
                                           pct_increase IN NUMBER,
                                           upper_bound IN NUMBER) 
AS
    emp_count NUMBER := 0;
    emp_sal employees.salary%TYPE;
    Results VARCHAR2(50);
BEGIN
    SELECT salary
      INTO 
           emp_sal
      FROM employees
     WHERE employee_id = empno_in;
    
    IF emp_sal < upper_bound AND round(emp_sal + (emp_sal * pct_increase), 2) < upper_bound THEN
        UPDATE 
               employees
           SET salary = round(salary + (salary * pct_increase),2)
         WHERE employee_id = empno_in;
        
        results := 'SUCCESSFUL INCREASE';
    ELSE
        results := 'EMPLOYEE MAKES TOO MUCH, DECREASE RAISE PERCENTAGE';
    END IF;
    DBMS_OUTPUT.PUT_LINE(results);
EXCEPTION
WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'No employee match for the given ID');
END;
/