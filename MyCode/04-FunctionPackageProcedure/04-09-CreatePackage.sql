CREATE OR REPLACE PACKAGE process_employee_time 
IS
    total_employee_salary NUMBER;
PROCEDURE grant_raises(pct_increase IN NUMBER,
                       upper_bound IN NUMBER);
PROCEDURE increase_wage (empno_in IN NUMBER,
                         pct_increase IN NUMBER,
                         upper_bound IN NUMBER) ;
END;
/
CREATE OR REPLACE PACKAGE BODY process_employee_time 
IS
PROCEDURE grant_raises (pct_increase IN NUMBER,
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
PROCEDURE INCREASE_WAGE (empno_in IN NUMBER,
                         pct_increase IN NUMBER,
                         upper_bound IN NUMBER) 
AS
    emp_count NUMBER := 0;
    emp_sal employees.salary%TYPE;
    Results VARCHAR2(50);
BEGIN
    SELECT count(*)
      INTO 
           emp_count
      FROM employees
     WHERE employee_id = empno_in;
    
    IF emp_count > 0 THEN
        -- IF EMPLOYEE FOUND, THEN OBTAIN RECORD
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
    ELSE
        Results := 'NO EMPLOYEE FOUND';
    END IF;
    DBMS_OUTPUT.PUT_LINE(results);
END;
END;