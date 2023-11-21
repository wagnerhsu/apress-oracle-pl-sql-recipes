DBMS_OUTPUT.ENABLE;
DECLARE
    person_name person.person.name%TYPE;
    person_id person.person.personid%TYPE;
    name VARCHAR;
    sql VARCHAR;
BEGIN
    name := '¿Ó¿ˆ';
    BEGIN
    sql := 'SELECT PERSONID, NAME  FROM PERSON.PERSON WHERE NAME = :name';
    EXECUTE IMMEDIATE sql INTO person_id, person_name  using name;
    pkg_common.prc_dump(person_id || ':' || person_name);
    END;
END;