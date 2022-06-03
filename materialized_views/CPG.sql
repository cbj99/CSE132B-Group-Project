CREATE MATERIALIZED VIEW CPG AS
(
    (SELECT past_enrollment.course_number, past_enrollment.faculty_name, past_enrollment.grade, count(*)
    FROM past_enrollment, GRADE_CONVERSION
    WHERE past_enrollment.grade = GRADE_CONVERSION.grade 
    GROUP BY past_enrollment.course_number, past_enrollment.faculty_name, past_enrollment.grade)
    union
    (SELECT past_enrollment.course_number, past_enrollment.faculty_name, 'other' as grade, count(*)
    FROM past_enrollment
    WHERE past_enrollment.grade not in (select grade from GRADE_CONVERSION)
    GROUP BY past_enrollment.course_number, past_enrollment.faculty_name)
);