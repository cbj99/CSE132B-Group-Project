-- The lectures ('LE'), discussions('DI') and lab('LAB') meetings of a section should not happen at the same time.

-- query for checking collusion time
-- (same class, same data, differnet type, same time) -> error
-- SELECT count(*)
-- FROM meetings
-- WHERE
--     meeting.course_number = NEW.course_number and 
--     meeting.year_ = NEW.year_ and 
--     meeting.qaurter = NEW.quarter and 
--     meeting.section_id = NEW.section_id and 
--     meeting.type_ != NEW.type_ and 
--     meeting.date_ = NEW.date_ and 
--     meeting.begin_time == NEW.begin_time and 
--     meeting.end_time = NEW.end_time

-- trigger function
CREATE or REPLACE FUNCTION trigger_function_colluding_time() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
    IF((
    SELECT count(*)
    FROM meetings
    WHERE
        meetings.course_number = NEW.course_number and 
        meetings.year_ = NEW.year_ and 
        meetings.quarter = NEW.quarter and 
        meetings.section_id = NEW.section_id and 
        meetings.type_ != NEW.type_ and 
        meetings.date_ = NEW.date_ and 
        (new.begin_time, new.end_time) overlaps (meetings.begin_time, meetings.end_time)
    ) > 0)
    THEN 
        raise exception 'Error 1: The lectures, discussions and lab meetings of a section should not happen at the same time';
    END IF; 
    return new; 
END;
-- connecting trigger
$$;
CREATE or replace TRIGGER check_meeting_time 
    BEFORE INSERT on meetings
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_function_colluding_time(); 


-- testing insertions, should raise an error
-- INSERT INTO meetings VALUES
--     ('MATH132A', 2018, 'SPRING', 'A00', 'Discussion', '2018-3-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1')