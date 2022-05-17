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
with completed_courses AS(
    SELECT past_enrollment.course_number, GRADE_CONVERSION.NUMBER_GRADE
    FROM past_enrollment, GRADE_CONVERSION
    WHERE past_enrollment.student_id = 3 and 
          (SELECT GRADE_CONVERSION.NUMBER_GRADE
           WHERE GRADE_CONVERSION.GRADE = past_enrollment.grade
          ) > 3
),
degree_sepcific_concentration AS(
    SELECT distinct(gradudateDegreeRequiarment.concentration) AS concentration
    from gradudateDegreeRequiarment
    WHERE degree_id = 'CS266'
), 
completed_concentration AS(
    SELECT gradudateDegreeRequiarment.course_number, gradudateDegreeRequiarment.concentration
    FROM gradudateDegreeRequiarment, completed_courses, degree_sepcific_concentration
    WHERE gradudateDegreeRequiarment.concentration = degree_sepcific_concentration.concentration and 
          gradudateDegreeRequiarment.course_number = completed_courses.course_number
)
SELECT distinct(GDR.concentration)
FROM gradudateDegreeRequiarment as GDR
WHERE GDR.degree_id = 'CS266' and not exists
    (SELECT * FROM gradudateDegreeRequiarment as GDR2 
     WHERE GDR2.concentration = GDR.concentration and not exists
        (SELECT * FROM completed_concentration 
         WHERE completed_concentration.concentration = GDR2.concentration and 
         completed_concentration.course_number = GDR2.course_number
        )
    )

SELECT * FROM completed_concentration; 
select * from completed_courses; 
select * from degree_sepcific_concentration; 

/* 
    4. Given the student name X and degree name Y, list the set of courses that the student has not yet taken from every concentration C in Y (even for the concentrations C that X has completed). Next to each course display the next time that this course is given (i.e. the earliest time at which a class of this course is given after SPRING 2020).
*/ 
with all_classes_taken AS
((SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)),
un_completed_course AS(
    SELECT GDB2.course_number, GDB2.concentration
    FROM gradudateDegreeRequiarment as GDB2 
    where (GDB2.course_number, GDB2.concentration) not in 
        (
        SELECT GDB.course_number, GDB.concentration
        FROM all_classes_taken, gradudateDegreeRequiarment AS GDB
        WHERE GDB.course_number = all_classes_taken.course_number and all_classes_taken.student_id = 3 and GDB.degree_id = 'CS266'
        )
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




/* 
    showing GPA
    showing units 
*/ 
WITH total_enrollment as ((SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)), 
qtrgpa as (SELECT year_, quarter, avg(number_grade) as gpa FROM (total_enrollment JOIN grade_conversion ON total_enrollment.grade = grade_conversion.grade) where student_id = 3 GROUP BY year_, quarter) 
SELECT * FROM qtrgpa;

WITH total_enrollment AS(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, grade FROM enrollment) UNION (SELECT * FROM past_enrollment)
),
all_courses AS(
    select distinct(course_number) 
    FROM total_enrollment
    WHERE total_enrollment.student_id = 3
)
select sum(courses.unit)
from all_courses, courses
where all_courses.course_number = courses.course_number and courses.is_upper = 2