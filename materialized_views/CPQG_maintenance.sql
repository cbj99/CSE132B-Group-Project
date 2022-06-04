CREATE OR REPLACE FUNCTION update_cpqg()
    RETURNS trigger 
    LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT FROM CPQG c WHERE c.course_number = NEW.course_number 
    AND c.year_ = NEW.year_ AND c.quarter = NEW.quarter AND c.faculty_name = NEW.faculty_name AND c.grade = NEW.grade) THEN
        UPDATE CPQG SET count_ = count_ + 1 WHERE course_number = NEW.course_number 
        AND year_ = NEW.year_ AND quarter = NEW.quarter AND faculty_name = NEW.faculty_name AND grade = NEW.grade;
        RETURN NEW;
    ELSE        
        INSERT INTO CPQG VALUES(NEW.course_number, NEW.faculty_name, NEW.year_, NEW.quarter, NEW.grade, 1 );
        RETURN NEW;
    END IF;
END;
$$;


CREATE or replace TRIGGER CPQG_maintenance 
    AFTER INSERT on past_enrollment
    FOR EACH ROW
    EXECUTE procedure update_cpqg();