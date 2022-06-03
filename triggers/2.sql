-- If the enrollment limit of a section has been reached then additional enrollments should be rejected. It is not required to update the waitlist
-- create Trigger
CREATE TRIGGER enrollment_limit 
    BEFORE INSERT on enrollment
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_function_enrollment_limit(); 

-- Trigger Functions
CREATE or REPLACE FUNCTION trigger_function_enrollment_limit() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
    IF
    (
        (
        select count(*)
        FROM enrollment
        WHERE 
            enrollment.course_number = new.course_number and 
            enrollment.year_ = new.year_ and 
            enrollment.quarter = new.quarter and 
            enrollment.section_id = new.section_id and 
            enrollment.faculty_name = new.faculty_name
        GROUP BY
            course_number,
            year_,
            quarter,
            section_id,
            faculty_name
        )
        >=
        (
        select location_.capacity 
        FROM location_ 
        WHERE (location_.room_number, location_.building_number) in
            (
                select distinct meetings.room_number, meetings.building_number
                FROM meetings, location_
                WHERE 
                    meetings.course_number = new.course_number and 
                    meetings.year_ = new.year_ and 
                    meetings.quarter = new.quarter and 
                    meetings.section_id = new.section_id and 
                    meetings.faculty_name = new.faculty_name and 
                    meetings.type_ = 'Lecture' 
                GROUP BY
                    meetings.date_, 
                    meetings.room_number, 
                    meetings.building_number
            )
        )
    )
    THEN 
        raise exception 'enrollment limit has been reached';
    END IF; 
    return new; 
END;
$$

-- count number of students
select count(*)
FROM enrollment
WHERE 
    enrollment.course_number = new.course_number and 
    enrollment.year_ = new.year_ and 
    enrollment.quarter = new.quarter and 
    enrollment.section_id = new.section_id and 
    enrollment.faculty_name = new.faculty_name
GROUP BY
    course_number,
    year_,
    quarter,
    section_id,
    faculty_name

select location_.capacity 
FROM location_ 
WHERE (location_.room_number, location_.building_number) in
(
    select distinct meetings.room_number, meetings.building_number
    FROM meetings, location_
    WHERE 
        meetings.course_number = new.course_number and 
        meetings.year_ = new.year_ and 
        meetings.quarter = new.quarter and 
        meetings.section_id = new.section_id and 
        meetings.faculty_name = new.faculty_name and 
        meetings.type_ = 'Lecture' 
    GROUP BY
        meetings.date_, 
        meetings.room_number, 
        meetings.building_number
)


-- Test Queries
select count(*)
FROM enrollment
WHERE 
    enrollment.course_number = 'CSE132A' and 
    enrollment.year_ = 2018 and 
    enrollment.quarter = 'SPRING' and 
    enrollment.section_id = 'A00' and 
    enrollment.faculty_name = 'Faculty1'
GROUP BY
    course_number,
    year_,
    quarter,
    section_id,
    faculty_name

select location_.capacity 
FROM location_ 
WHERE (location_.room_number, location_.building_number) in
(
    select distinct meetings.room_number, meetings.building_number
    FROM meetings, location_
    WHERE 
        meetings.course_number = 'CSE132A' and 
        meetings.year_ = 2018 and 
        meetings.quarter = 'SPRING' and 
        meetings.section_id = 'A00' and 
        meetings.faculty_name = 'Faculty1' and 
        meetings.type_ = 'Lecture' 
    GROUP BY
        meetings.date_, 
        meetings.room_number, 
        meetings.building_number
)

-- using this data
INSERT INTO enrollment VALUES
    (141414141, 'CSE132A', 2018, 'SPRING', 'A00', 'Faculty1', 4, 'INPROGRESS', 'INPROGRESS')
    
INSERT INTO enrollment VALUES
    (141414141, 'CSE132B', 2018, 'SPRING', 'A00', 'Faculty1', 4, 'INPROGRESS', 'INPROGRESS')

-- modify location to test
update location_ 
set capacity = 3
where room_number = 'RCLAS' and room_number = 'RCLAS'