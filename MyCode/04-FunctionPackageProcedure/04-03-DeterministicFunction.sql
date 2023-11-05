CREATE OR REPLACE FUNCTION manager_name(mgr_id IN NUMBER)
    RETURN VARCHAR2 DETERMINISTIC 
IS
    first_name employees.first_name%TYPE;
    last_name employees.last_name%TYPE;
BEGIN
    IF mgr_id IS NOT NULL THEN
        SELECT first_name, 
               last_name
          INTO 
               first_name, 
               last_name
          FROM EMPLOYEES
         WHERE employee_id = mgr_id;
        
        RETURN first_name || ' ' || last_name;
    ELSE
        RETURN 'N/A';
    END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    RETURN 'N/A';
END;
/