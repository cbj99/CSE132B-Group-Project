CREATE or REPLACE FUNCTION trigger_function_update_CPG() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
with update_required as 
(
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade, 
        count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE 
        course_number = new.course_number AND 
        faculty_name = new.faculty_name AND
        GRADE_CONVERSION.GRADE = past_enrollment.grade
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    ) 
    UNION 
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        'other' as grade, 
        count(*)
    FROM past_enrollment
    WHERE 
        course_number = new.course_number AND 
        faculty_name = new.faculty_name AND
        past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    )
), 
not_exist as 
(
	select * from update_required
	where 
		(course_number, faculty_name, grade) not in 
		(select course_number, faculty_name, grade from CPG)
)
INSERT INTO CPG
select * from not_exist;

with update_required as 
(
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade, 
        count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE 
        course_number = new.course_number AND 
        faculty_name = new.faculty_name AND
        GRADE_CONVERSION.GRADE = past_enrollment.grade
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    ) 
    UNION 
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        'other' as grade, 
        count(*)
    FROM past_enrollment
    WHERE 
        course_number = new.course_number AND 
        faculty_name = new.faculty_name AND
        past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    )
)
UPDATE CPG 
set count_ = count_ 
FROM update_required
where 
    CPG.course_number = update_required.course_number and 
    CPG.faculty_name = update_required.faculty_name and 
    CPG.grade = update_required.grade;

return new; 
END;
$$


CREATE or replace TRIGGER update_CPG 
    AFTER INSERT on past_enrollment
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_function_update_CPG(); 


-- queries 
-- (111111111, 'CSE132B', 2015, 'FALL', 'A00', 'Faculty1', 4, 'A'),
with update_required as 
(
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade, 
        count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE 
        course_number = 'CSE132B' AND 
        faculty_name = 'Faculty1' AND
        GRADE_CONVERSION.GRADE = past_enrollment.grade
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    ) 
    UNION 
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        'other' as grade, 
        count(*)
    FROM past_enrollment
    WHERE 
        course_number = 'CSE132B' AND 
        faculty_name = 'Faculty1' AND
        past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    )
), 
not_exist as 
(
	select * from update_required
	where 
		(course_number, faculty_name, grade) not in 
		(select course_number, faculty_name, grade from CPG)
)
INSERT INTO CPG
select * from not_exist;

with update_required as 
(
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade, 
        count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE 
        course_number = 'CSE132B' AND 
        faculty_name = 'Faculty1' AND
        GRADE_CONVERSION.GRADE = past_enrollment.grade
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    ) 
    UNION 
    (
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        'other' as grade, 
        count(*)
    FROM past_enrollment
    WHERE 
        course_number = 'CSE132B' AND 
        faculty_name = 'Faculty1' AND
        past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY 
        past_enrollment.course_number, 
        past_enrollment.faculty_name, 
        past_enrollment.grade
    )
)
UPDATE CPG 
set count_ = count_ 
FROM update_required
where 
    CPG.course_number = update_required.course_number and 
    CPG.faculty_name = update_required.faculty_name and 
    CPG.grade = update_required.grade 