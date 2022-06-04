/* 
Build a view, named CPQG, that has one tuple for every course id X, professor Y, quarter
Z, and grade W, where W is one of “A”, “B”, “C”, “D”, and “other”. The tuple contains the
count of grade W’s that professor Y gave at quarter Z to the students taking course X. This
view is supposed to facilitate the decision support query (3.a.2). All the explanations
applicable to (3.a.2) apply to the view as well
*/ 
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