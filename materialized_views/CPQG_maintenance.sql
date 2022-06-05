CREATE or REPLACE FUNCTION trigger_function_update_CPG() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN

end; 


CREATE or replace TRIGGER CPQG_maintenance 
    AFTER INSERT on past_enrollment
    FOR EACH ROW
BEGIN

-- testing queries
with update_required as 
( 
(SELECT past_enrollment.course_number, past_enrollment.faculty_name, past_enrollment.year_, past_enrollment.quarter,  past_enrollment.grade, count(*)
FROM past_enrollment, GRADE_CONVERSION
WHERE past_enrollment.grade = GRADE_CONVERSION.grade and course_number = 'CSE132B' AND faculty_name = 'Faculty1'  
GROUP BY past_enrollment.course_number, past_enrollment.quarter, past_enrollment.faculty_name, past_enrollment.grade, past_enrollment.year_)
union
(SELECT past_enrollment.course_number, past_enrollment.faculty_name, past_enrollment.year_, past_enrollment.quarter, 'other' as grade, count(*)
FROM past_enrollment
WHERE course_number = 'CSE132B' AND faculty_name = 'Faculty1'  and past_enrollment.grade not in (select grade from GRADE_CONVERSION) 
GROUP BY past_enrollment.course_number, past_enrollment.quarter, past_enrollment.faculty_name, past_enrollment.year_)
),
not_exist as 
(
	select * from update_required
	where 
		(update_required.course_number, update_required.faculty_name, update_required.year_, update_required.quarter, update_required.grade) not in 
		(select CPQG.course_number, CPQG.faculty_name, CPQG.year_, CPQG.quarter, CPQG.grade from CPQG)
)
INSERT INTO CPQG
select * from not_exist;

with update_required as 
( 
(SELECT past_enrollment.course_number, past_enrollment.faculty_name, past_enrollment.year_, past_enrollment.quarter,  past_enrollment.grade, count(*)
FROM past_enrollment, GRADE_CONVERSION
WHERE past_enrollment.grade = GRADE_CONVERSION.grade and course_number = 'CSE132B' AND faculty_name = 'Faculty1'  
GROUP BY past_enrollment.course_number, past_enrollment.quarter, past_enrollment.faculty_name, past_enrollment.grade, past_enrollment.year_)
union
(SELECT past_enrollment.course_number, past_enrollment.faculty_name, past_enrollment.year_, past_enrollment.quarter, 'other' as grade, count(*)
FROM past_enrollment
WHERE course_number = 'CSE132B' AND faculty_name = 'Faculty1'  and past_enrollment.grade not in (select grade from GRADE_CONVERSION) 
GROUP BY past_enrollment.course_number, past_enrollment.quarter, past_enrollment.faculty_name, past_enrollment.year_)
)
UPDATE CPQG 
set count_ = count_ 
FROM update_required
where 
    CPQG.course_number = update_required.course_number and 
    CPQG.faculty_name = update_required.faculty_name and 
    CPQG.grade = update_required.grade and 
    CPQG.year_ = update_required.year_ and
    CPQG.quarter = update_required.quarter;