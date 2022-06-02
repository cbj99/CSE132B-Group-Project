-- check insertion of the same time sane type just return new  
select 
    count(*)
FROM meetings 
where 
    meetings.course_number = 'CSE132A' and 
    meetings.year_ = 2018 and 
    meetings.quarter = 'SPRING' and 
    meetings.section_id = 'A00' and 
    meetings.faculty_name = 'Faculty1' and 
    meetings.type_ = 'Lecture' and 
    meetings.begin_time = '13:00:00'::time and 
    meetings.end_time = '15:00:00'::time

-- check overlap of lecture of all courses faculty is teaching
with faculty_lecture_time as 
(
    select 
        meetings.course_number,
        meetings.section_id,
        meetings.begin_time, 
        meetings.end_time
    FROM meetings 
    where 
        meetings.year_ = 2018 and 
        meetings.quarter = 'SPRING' and 
        meetings.faculty_name = 'Faculty1' and 
        meetings.type_ = 'Lecture' 
    group by 
        meetings.course_number,
        meetings.section_id,
        meetings.begin_time, 
        meetings.end_time
        
)
select count(*)
from 
    faculty_lecture_time
where ('14:00:00'::time, '15:00:00'::time) overlaps (faculty_lecture_time.begin_time, faculty_lecture_time.end_time)

-- function query
with faculty_lecture_time as 
(
    select 
        meetings.course_number,
        meetings.section_id,
        meetings.begin_time, 
        meetings.end_time
    FROM meetings 
    where 
        meetings.year_ = new.year_ and 
        meetings.quarter = new.quarter and 
        meetings.faculty_name = new.faculty_name and 
        meetings.type_ = 'Lecture' 
    group by 
        meetings.course_number,
        meetings.section_id,
        meetings.begin_time, 
        meetings.end_time
        
)
select count(*)
from 
    faculty_lecture_time
where ('14:00:00'::time, '15:00:00'::time) overlaps (faculty_lecture_time.begin_time, faculty_lecture_time.end_time)


CREATE or replace TRIGGER check_metting_overlapping 
    BEFORE INSERT on meetings
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_function_overlapping_time(); 

-- trigger function CREATE or REPLACE FUNCTION trigger_function_enrollment_limit() 
CREATE or REPLACE FUNCTION trigger_function_overlapping_time() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
    IF
    (
        select 
            count(*)
        FROM meetings 
        where 
            meetings.course_number = new.course_number and 
            meetings.year_ = new.year_ and 
            meetings.quarter = new.quarter and 
            meetings.section_id = new.section_id and 
            meetings.faculty_name = new.faculty_name and 
            meetings.type_ = 'Lecture' and 
            meetings.begin_time = new.begin_time and 
            meetings.end_time = new.end_time
    ) > 0
    THEN 
        return new; 

    ELSIF
    (
        with faculty_lecture_time as 
        (
            select 
                meetings.course_number,
                meetings.section_id,
                meetings.begin_time, 
                meetings.end_time
            FROM meetings 
            where 
                meetings.year_ = new.year_ and 
                meetings.quarter = new.quarter and 
                meetings.faculty_name = new.faculty_name and 
                meetings.type_ = 'Lecture' 
            group by 
                meetings.course_number,
                meetings.section_id,
                meetings.begin_time, 
                meetings.end_time
                
        )
        select count(*)
        from 
            faculty_lecture_time
        where (new.begin_time, new.end_time) overlaps (faculty_lecture_time.begin_time, faculty_lecture_time.end_time)
    ) > 0
    THEN 
        raise exception 'collution with lecture time';
    END IF; 

    return new; 
END;
$$

-- test 
CREATE or REPLACE FUNCTION trigger_function_overlapping_time() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
    IF
    (
        with faculty_lecture_time as 
        (
            select 
                meetings.course_number,
                meetings.section_id,
                meetings.begin_time, 
                meetings.end_time
            FROM meetings 
            where 
                meetings.year_ = new.year_ and 
                meetings.quarter = new.quarter and 
                meetings.faculty_name = new.faculty_name and 
                meetings.type_ = 'Lecture' 
            group by 
                meetings.course_number,
                meetings.section_id,
                meetings.begin_time, 
                meetings.end_time
                
        )
        select count(*)
        from 
            faculty_lecture_time
        where (new.begin_time, new.end_time) overlaps (faculty_lecture_time.begin_time, faculty_lecture_time.end_time)
    ) > 0
    THEN 
        raise exception 'collution with lecture time';
    END IF; 

    return new; 
END;
$$



INSERT INTO meetings VALUES
    ('MATH132A', 2018, 'SPRING', 'A00', 'Lecture', '2018-3-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1')