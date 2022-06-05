/**
Build a view, named CPG, that has one tuple for every course id X, professor Y and grade
Z. The tuple contains the count of the specific grade Z that professor Y has given, when
teaching course X. This view facilitates the decision support query (3.a.3).
*/ 
CREATE MATERIALIZED VIEW CPQG AS
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
    
);