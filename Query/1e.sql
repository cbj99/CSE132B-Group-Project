/*
    1. The form has two HTML SELECT controls, one with all MS student names enrolled in the current quarter, and one with all MS degrees. Display the same information you did on the   form for query d.
*/ 
SELECT distinct(MSStudent.student_id) from enrollment, MSStudent where MSStudent.student_id = enrollment.student_id order by student_id;


SELECT graduateDegree.degree_id from graduateDegree where institution ='UCSD' order by degree_id;

SELECT student_id, SSN, first_name, last_name from MSStudent where student_id=3;

SELECT degree_name, department from graduateDegree where degree_id='CS266' and institution ='UCSD';

SELECT distinct(concentration) from gradudateDegreeRequiarment where degree_id='CS266' and institution ='UCSD';


/* 
    2. Display the NAME of all the concentrations in Y that a student X has completed.

    3. Remember that a student has completed a concentration if first, he/she has taken some minimum number of units of courses in that concentration and second, the GPA of courses he has taken in that concentration is above some minimum number
*/ 
-- new version
with completed_courses AS(
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.unit_taken,
        GRADE_CONVERSION.NUMBER_GRADE
    FROM 
        past_enrollment, 
        GRADE_CONVERSION
    WHERE 
        past_enrollment.student_id = 111111111 and
        GRADE_CONVERSION.GRADE = past_enrollment.grade
), 
degree_sepcific_concentration AS(
    SELECT distinct(gradudateDegreeRequiarment.concentration) AS concentration
    from gradudateDegreeRequiarment
    WHERE degree_id = 'CS266'
), 
concentration_course_completed AS(
    SELECT
        completed_courses.course_number, 
        completed_courses.number_grade, 
		completed_courses.unit_taken,
		degree_sepcific_concentration.concentration
    FROM 
        completed_courses,
        degree_sepcific_concentration,
        gradudateDegreeRequiarment
    WHERE
        completed_courses.course_number = gradudateDegreeRequiarment.course_number and 
		gradudateDegreeRequiarment.concentration = degree_sepcific_concentration.concentration

),
concentration_check AS(
	select 
		concentration_course_completed.concentration,
    	sum(concentration_course_completed.unit_taken) as total_units, 
    	sum(number_grade * unit_taken) / sum(unit_taken) as gpa
	from 
    	concentration_course_completed
	group by 
    	concentration_course_completed.concentration
), 
concentration_satisfied AS(
	select
		distinct(concentration_check.concentration)
	from
		concentration_check, 
		gradudateDegreeRequiarment
	where
		gradudateDegreeRequiarment.concentration = concentration_check.concentration and 
		concentration_check.total_units > gradudateDegreeRequiarment.concentration_units and 
		concentration_check.gpa > gradudateDegreeRequiarment.minimum_gpa
		
)
select * from concentration_satisfied

-- new version Question Mark
with completed_courses AS(
    SELECT 
        past_enrollment.course_number, 
        past_enrollment.unit_taken,
        GRADE_CONVERSION.NUMBER_GRADE
    FROM 
        past_enrollment, 
        GRADE_CONVERSION
    WHERE 
        past_enrollment.student_id = ? and
        GRADE_CONVERSION.GRADE = past_enrollment.grade
), 
degree_sepcific_concentration AS(
    SELECT distinct(gradudateDegreeRequiarment.concentration) AS concentration
    from gradudateDegreeRequiarment
    WHERE degree_id = ?
), 
concentration_course_completed AS(
    SELECT
        completed_courses.course_number, 
        completed_courses.number_grade, 
		completed_courses.unit_taken,
		degree_sepcific_concentration.concentration
    FROM 
        completed_courses,
        degree_sepcific_concentration,
        gradudateDegreeRequiarment
    WHERE
        completed_courses.course_number = gradudateDegreeRequiarment.course_number and 
		gradudateDegreeRequiarment.concentration = degree_sepcific_concentration.concentration

),
concentration_check AS(
	select 
		concentration_course_completed.concentration,
    	sum(concentration_course_completed.unit_taken) as total_units, 
    	sum(number_grade * unit_taken) / sum(unit_taken) as gpa
	from 
    	concentration_course_completed
	group by 
    	concentration_course_completed.concentration
), 
concentration_satisfied AS(
	select
		distinct(concentration_check.concentration)
	from
		concentration_check, 
		gradudateDegreeRequiarment
	where
		gradudateDegreeRequiarment.concentration = concentration_check.concentration and 
		concentration_check.total_units > gradudateDegreeRequiarment.concentration_units and 
		concentration_check.gpa > gradudateDegreeRequiarment.minimum_gpa
		
)
select * from concentration_satisfied


-- with completed_courses AS(
--     SELECT past_enrollment.course_number, GRADE_CONVERSION.NUMBER_GRADE
--     FROM past_enrollment, GRADE_CONVERSION
--     WHERE past_enrollment.student_id = 3 and 
--           (SELECT GRADE_CONVERSION.NUMBER_GRADE
--            WHERE GRADE_CONVERSION.GRADE = past_enrollment.grade
--           ) > 3
-- ),
-- degree_sepcific_concentration AS(
--     SELECT distinct(gradudateDegreeRequiarment.concentration) AS concentration
--     from gradudateDegreeRequiarment
--     WHERE degree_id = 'CS266'
-- ), 
-- completed_concentration AS(
--     SELECT gradudateDegreeRequiarment.course_number, gradudateDegreeRequiarment.concentration
--     FROM gradudateDegreeRequiarment, completed_courses, degree_sepcific_concentration
--     WHERE gradudateDegreeRequiarment.concentration = degree_sepcific_concentration.concentration and 
--           gradudateDegreeRequiarment.course_number = completed_courses.course_number
-- )
-- SELECT distinct(GDR.concentration)
-- FROM gradudateDegreeRequiarment as GDR
-- WHERE GDR.degree_id = 'CS266' and not exists
--     (SELECT * FROM gradudateDegreeRequiarment as GDR2 
--      WHERE GDR2.concentration = GDR.concentration and not exists
--         (SELECT * FROM completed_concentration 
--          WHERE completed_concentration.concentration = GDR2.concentration and 
--          completed_concentration.course_number = GDR2.course_number
--         )
--     )

-- SELECT * FROM completed_concentration; 
-- select * from completed_courses; 
-- select * from degree_sepcific_concentration; 





/* 
    4. Given the student name X and degree name Y, list the set of courses that the student has not yet taken from every concentration C in Y (even for the concentrations C that X has completed). Next to each course display the next time that this course is given (i.e. the earliest time at which a class of this course is given after SPRING 2020).
*/ 
-- mew version
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) 
    UNION 
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
),
completed_courses AS(
    SELECT 
        total_enrollment.course_number
    FROM 
        total_enrollment
    WHERE 
        total_enrollment.student_id = 111111111
), 
degree_sepcific_concentration AS(
    SELECT distinct(gradudateDegreeRequiarment.concentration) AS concentration
    from gradudateDegreeRequiarment
    WHERE degree_id = 'CS266'
), 
degree_sepcific_concentration_course AS(
    SELECT course_number, concentration
    from gradudateDegreeRequiarment
    WHERE degree_id = 'CS266'
), 
concentration_course_completed AS(
    SELECT
        completed_courses.course_number, 
		degree_sepcific_concentration.concentration
    FROM 
        completed_courses,
        degree_sepcific_concentration,
        gradudateDegreeRequiarment
    WHERE
        completed_courses.course_number = gradudateDegreeRequiarment.course_number and 
		gradudateDegreeRequiarment.concentration = degree_sepcific_concentration.concentration

), 
un_completed_course AS(
    SELECT 
		degree_sepcific_concentration_course.course_number, 
		degree_sepcific_concentration_course.concentration
    FROM 
		concentration_course_completed,
		degree_sepcific_concentration_course
    where 
		(degree_sepcific_concentration_course.course_number, degree_sepcific_concentration_course.concentration) not in (select * from concentration_course_completed)
	group by 
		degree_sepcific_concentration_course.course_number, 
		degree_sepcific_concentration_course.concentration
),
earliest_classes AS(
SELECT ny.course_number, ny.year_, ny.quarter
FROM course_offering_ny as ny, un_completed_course as un 
WHERE ny.course_number = un.course_number and 
      not exists(
        SELECT * FROM course_offering_ny as ny2
        WHERE ny.course_number = ny2.course_number and 
        (
            (ny2.year_ < ny.year_) or 
            ( 
                ny.year_ = ny2.year_ and 
                (
                    (ny.quarter='spring' and ny2.quarter='winter') or 
                    (
                        ny.quarter='fall' and 
                        (
                            ny2.quarter='winter' or ny2.quarter='spring'
                        ) 
                    )
                )
            )
        )
      )
) 
select earliest_classes.course_number, earliest_classes.year_, earliest_classes.quarter, gradudateDegreeRequiarment.concentration
from earliest_classes, gradudateDegreeRequiarment
WHERE gradudateDegreeRequiarment.degree_id = 'CS266' and gradudateDegreeRequiarment.course_number = earliest_classes.course_number;


-- Question Mark
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) 
    UNION 
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
),
completed_courses AS(
    SELECT 
        total_enrollment.course_number
    FROM 
        total_enrollment
    WHERE 
        total_enrollment.student_id = ?
), 
degree_sepcific_concentration AS(
    SELECT distinct(gradudateDegreeRequiarment.concentration) AS concentration
    from gradudateDegreeRequiarment
    WHERE degree_id = ?
), 
degree_sepcific_concentration_course AS(
    SELECT course_number, concentration
    from gradudateDegreeRequiarment
    WHERE degree_id = ?
), 
concentration_course_completed AS(
    SELECT
        completed_courses.course_number, 
		degree_sepcific_concentration.concentration
    FROM 
        completed_courses,
        degree_sepcific_concentration,
        gradudateDegreeRequiarment
    WHERE
        completed_courses.course_number = gradudateDegreeRequiarment.course_number and 
		gradudateDegreeRequiarment.concentration = degree_sepcific_concentration.concentration

), 
un_completed_course AS(
    SELECT 
		degree_sepcific_concentration_course.course_number, 
		degree_sepcific_concentration_course.concentration
    FROM 
		concentration_course_completed,
		degree_sepcific_concentration_course
    where 
		(degree_sepcific_concentration_course.course_number, degree_sepcific_concentration_course.concentration) not in (select * from concentration_course_completed)
	group by 
		degree_sepcific_concentration_course.course_number, 
		degree_sepcific_concentration_course.concentration
),
earliest_classes AS(
SELECT ny.course_number, ny.year_, ny.quarter
FROM course_offering_ny as ny, un_completed_course as un 
WHERE ny.course_number = un.course_number and 
      not exists(
        SELECT * FROM course_offering_ny as ny2
        WHERE ny.course_number = ny2.course_number and 
        (
            (ny2.year_ < ny.year_) or 
            ( 
                ny.year_ = ny2.year_ and 
                (
                    (ny.quarter='spring' and ny2.quarter='winter') or 
                    (
                        ny.quarter='fall' and 
                        (
                            ny2.quarter='winter' or ny2.quarter='spring'
                        ) 
                    )
                )
            )
        )
      )
) 
select earliest_classes.course_number, earliest_classes.year_, earliest_classes.quarter, gradudateDegreeRequiarment.concentration
from earliest_classes, gradudateDegreeRequiarment
WHERE gradudateDegreeRequiarment.degree_id = ? and gradudateDegreeRequiarment.course_number = earliest_classes.course_number;

-- WITH total_enrollment as 
-- (
--     (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) 
--     UNION 
--     (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
-- ), 
-- un_completed_course AS(
--     SELECT GDB2.course_number, GDB2.concentration
--     FROM gradudateDegreeRequiarment as GDB2 
--     where (GDB2.course_number, GDB2.concentration) not in 
--         (
--         SELECT GDB.course_number, GDB.concentration
--         FROM total_enrollment, gradudateDegreeRequiarment AS GDB
--         WHERE GDB.course_number = total_enrollment.course_number and total_enrollment.student_id = 3 and GDB.degree_id = 'CS266'
--         )
-- ), 
-- earliest_classes AS(
-- SELECT ny.course_number, ny.year_, ny.quarter
-- FROM course_offering_ny as ny, un_completed_course as un 
-- WHERE ny.course_number = un.course_number and 
--       not exists(
--         SELECT * FROM course_offering_ny as ny2
--         WHERE ny.course_number = ny2.course_number and 
--         (
--             (ny2.year_ < ny.year_) or 
--             ( 
--                 ny.year_ = ny2.year_ and 
--                 (
--                     (ny.quarter='spring' and ny2.quarter='winter') or 
--                     (
--                         ny.quarter='fall' and 
--                         (
--                             ny2.quarter='winter' or ny2.quarter='spring'
--                         ) 
--                     )
--                 )
--             )
--         )
--       )
-- ) 
-- select earliest_classes.course_number, earliest_classes.year_, earliest_classes.quarter, gradudateDegreeRequiarment.concentration
-- from earliest_classes, gradudateDegreeRequiarment
-- WHERE gradudateDegreeRequiarment.degree_id = 'CS266' and gradudateDegreeRequiarment.course_number = earliest_classes.course_number;




/* 
    showing GPA
    showing units 
*/ 
-- WITH total_enrollment as 
-- (
--     (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken, grade FROM enrollment) 
--     UNION 
--     (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken, grade FROM past_enrollment)
-- ),
-- completed_courses AS(
--     SELECT 
--         total_enrollment.course_number, 
--         total_enrollment.unit_taken,
--         total_enrollment.NUMBER_GRADE
--     FROM 
--         total_enrollment, 
--         GRADE_CONVERSION
--     WHERE 
--         total_enrollment.student_id = 111111111 and
--         GRADE_CONVERSION.GRADE = total_enrollment.grade
-- ), 
-- gpa AS(
-- 	select 
--     	sum(number_grade * unit_taken) / sum(unit_taken) as gpa
-- 	from 
--     	completed_courses
-- ), 



-- -- WITH total_enrollment as ((SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)), 
-- -- qtrgpa as (SELECT year_, quarter, avg(number_grade) as gpa FROM (total_enrollment JOIN grade_conversion ON total_enrollment.grade = grade_conversion.grade) where student_id = 3 GROUP BY year_, quarter) 
-- -- SELECT * FROM qtrgpa;

-- WITH total_enrollment AS(
--     (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)
-- ),
-- all_courses AS(
--     select distinct(course_number) 
--     FROM total_enrollment
--     WHERE total_enrollment.student_id = 3
-- )
-- select sum(courses.unit)
-- from all_courses, courses
-- where all_courses.course_number = courses.course_number and courses.is_upper = 2