CREATE OR REPLACE FUNCTION update_cpg()
    RETURNS trigger 
    LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT FROM CPG c WHERE c.course_number = NEW.course_number AND c.faculty_name = NEW.faculty_name AND c.grade = NEW.grade) THEN
        UPDATE CPG SET count_ = count_ + 1 WHERE course_number = NEW.course_number AND faculty_name = NEW.faculty_name AND grade = NEW.grade;
        RETURN NEW;
    ELSE        
        INSERT INTO CPG VALUES(NEW.course_number, NEW.faculty_name, NEW.grade, 1 );
        RETURN NEW;
    END IF;
END;
$$;


CREATE or replace TRIGGER CPG_maintenance 
    AFTER INSERT on past_enrollment
    FOR EACH ROW
    EXECUTE procedure update_cpg();