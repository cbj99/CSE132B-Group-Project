/* 
    2. Given a course id (CID) X, a professor Y, and a quarter Z produce the count of "A", "B", "C", "D", and "other" grades that professor Y gave at quarter Z to the students taking course X. Note that course X may have had more than one corresponding sections in the quarter Z. Accumulate the counts of all sections given by professor Y

    accumulating all sections and all years
*/ 
with info as 
(
    (SELECT past_enrollment.course_number, past_enrollment.year_, past_enrollment.quarter, past_enrollment.faculty_name, past_enrollment.grade, count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE past_enrollment.grade = GRADE_CONVERSION.grade 
    GROUP BY past_enrollment.course_number, past_enrollment.quarter, past_enrollment.faculty_name, past_enrollment.grade, past_enrollment.year_
    order by past_enrollment.course_number)
	union
    (SELECT past_enrollment.course_number, past_enrollment.year_, past_enrollment.quarter, past_enrollment.faculty_name, 'other' as grade, count(*)
    FROM past_enrollment
    WHERE past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY past_enrollment.course_number, past_enrollment.quarter, past_enrollment.faculty_name, past_enrollment.year_
    order by past_enrollment.course_number)
    
)
SELECT * FROM info
-- where course_number='CSE008' and faculty_name='Faculty3' and quarter='FALL' and year_ = 2017
order by info.course_number;

/* 
    3. Given a course id X and a professor Y produce the count of "A", "B", "C", "D", and "other" grades professor Y has given over the years
*/
with info2 as 
(
    (SELECT past_enrollment.course_number, past_enrollment.year_, past_enrollment.faculty_name, past_enrollment.grade, count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE past_enrollment.grade = GRADE_CONVERSION.grade 
    GROUP BY past_enrollment.course_number, past_enrollment.year_, past_enrollment.faculty_name, past_enrollment.grade)
    union
    (SELECT past_enrollment.course_number, past_enrollment.year_, past_enrollment.faculty_name, 'other' as grade, count(*)
    FROM past_enrollment
    WHERE past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY past_enrollment.course_number, past_enrollment.year_, past_enrollment.faculty_name)
)
SELECT * FROM info2
-- where course_number=? and faculty_name=?
order by info2.course_number

/* 
    4. Given a course id X produce the count of "A", "B", "C", "D", and "other" grades given to students in X over the years
*/ 
with info3 as 
(
    (SELECT past_enrollment.course_number, past_enrollment.year_, past_enrollment.grade, count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE past_enrollment.grade = GRADE_CONVERSION.grade 
    GROUP BY past_enrollment.course_number, past_enrollment.grade, past_enrollment.year_)
    union
    (SELECT past_enrollment.course_number, past_enrollment.year_, 'other' as grade, count(*)
    FROM past_enrollment
    WHERE past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY past_enrollment.course_number, past_enrollment.year_)
)
SELECT * FROM info3
WHERE course_number=? 
order by info3.course_number

/* 
    5. Given a course id X and a professor Y produce the grade point average that professor Y has given at course X over the years.
*/ 
with convert_grade_value as 
(
    SELECT past_enrollment.student_id, past_enrollment.course_number, past_enrollment.year_, past_enrollment.quarter, past_enrollment.section_id, past_enrollment.section_id, past_enrollment.faculty_name, GRADE_CONVERSION.number_grade, courses.unit
    FROM past_enrollment, GRADE_CONVERSION, courses
    WHERE past_enrollment.grade = GRADE_CONVERSION.grade and courses.course_number = past_enrollment.course_number
)
SELECT convert_grade_value.course_number, convert_grade_value.faculty_name, convert_grade_value.year_, sum(convert_grade_value.number_grade * convert_grade_value.unit) / sum(convert_grade_value.unit) as gpa
FROM convert_grade_value
where course_number=? and faculty_name=?
GROUP BY convert_grade_value.course_number, convert_grade_value.faculty_name, convert_grade_value.year_