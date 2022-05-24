/*
    undergraduate student enroled in current quarter 
    undergraduate degree
    all for select clause 
*/
SELECT distinct(undergraduateStudent.student_id) from enrollment, undergraduateStudent where undergraduatestudent.student_id = enrollment.student_id order by student_id;

SELECT undergraduateDegree.degree_id from undergraduateDegree where institution ='UCSD' order by degree_id;
/*
    1. display 
*/
SELECT student_id, SSN, first_name, last_name from undergraduateStudent where student_id=3;

SELECT degree_name, type from undergraduateDegree where degree_id='CS26' and institution ='UCSD';

/*
    2. Display how many units the student has to take in order to graduate with degree Y
*/ 
SELECT upper_division_units, lower_division_units, core_units, technical_units, major_elective_units, college_units from undergraduateDegree where degree_id='CS26';

/*
    3. Display the minimum number of units the student has to take from each category (e.g. lower division units required, technical elective units required, etc.) in degree Y. Do this only for categories in Y and not concentrations
*/ 
-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_core='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number;
-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_technical_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number; 
-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_major_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number; 
-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_college_required='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number;

/*
4. If a class is contained in more than one categories, it will be counted as taken for evey
category it belongs to. For example assume that class 'DB APPS' is both an upper division
course and a technical elective for degree 'BSC IN CS'. Also assume that in order to get
the degree 'BSC IN CS' somebody should take at least 30 units of upper division courses
and 12 units of technical electives. Then if a student has taken 'DB APPS' for 4 units, they
still have to take at least 26 units of upper division courses and 8 units of technical
electives to be awarded the degre
*/ 


-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_core='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = 1) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = 1)); 

-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_technical_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = 1) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = 1)); 

-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_major_elective='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = 1) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = 1)); 

-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and is_college_required='YES' and courses.course_number = underGradudateDegreeRequiarment.course_number and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = 1) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = 1)); 

-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and courses.course_number = underGradudateDegreeRequiarment.course_number and courses.is_upper = 1 and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = 1) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = 1)); 

-- SELECT sum(courses.unit) FROM underGradudateDegreeRequiarment, courses where degree_id='CS26' and courses.course_number = underGradudateDegreeRequiarment.course_number and courses.is_upper = 0 and (underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM past_enrollment where student_id = 1) or underGradudateDegreeRequiarment.course_number in (SELECT course_number FROM enrollment where student_id = 1)); 


-- Query form 
-- core classes
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id='CS26' and 
    underGradudateDegreeRequiarment.is_core='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id = 111111111

WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id='CS26' and 
    underGradudateDegreeRequiarment.is_technical_elective='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id = 111111111

WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id='CS26' and 
    underGradudateDegreeRequiarment.is_major_elective='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id = 111111111


WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id='CS26' and 
    underGradudateDegreeRequiarment.is_college_required='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id = 111111111

-- upper division classes
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) 
    UNION 
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment, 
    courses
where 
    underGradudateDegreeRequiarment.degree_id='CS26' and 
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and
    courses.course_number = total_enrollment.course_number and 
    courses.is_upper = 1 and 
    total_enrollment.student_id = 111111111

-- lower division classes
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) 
    UNION 
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment, 
    courses
where 
    underGradudateDegreeRequiarment.degree_id='CS26' and 
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and
    courses.course_number = total_enrollment.course_number and 
    courses.is_upper = 0 and 
    total_enrollment.student_id = 111111111




-- with question mark
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id=? and 
    underGradudateDegreeRequiarment.is_core='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id =?

WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id=? and 
    underGradudateDegreeRequiarment.is_technical_elective='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id = ?

WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id=? and 
    underGradudateDegreeRequiarment.is_major_elective='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id = ?


WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) UNION (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment
where 
    underGradudateDegreeRequiarment.degree_id=? and 
    underGradudateDegreeRequiarment.is_college_required='YES' and
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and 
    total_enrollment.student_id = ?


-- upper division classes
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) 
    UNION 
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment, 
    courses
where 
    underGradudateDegreeRequiarment.degree_id=? and 
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and
    courses.course_number = total_enrollment.course_number and 
    courses.is_upper = 1 and 
    total_enrollment.student_id = ?

-- lower division classes
WITH total_enrollment as 
(
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM enrollment) 
    UNION 
    (SELECT student_id, course_number, year_, quarter, section_id, faculty_name, unit_taken FROM past_enrollment)
)
SELECT 
    sum(total_enrollment.unit_taken)
FROM 
    underGradudateDegreeRequiarment, 
    total_enrollment, 
    courses
where 
    underGradudateDegreeRequiarment.degree_id=? and 
    total_enrollment.course_number = underGradudateDegreeRequiarment.course_number and
    courses.course_number = total_enrollment.course_number and 
    courses.is_upper = 0 and 
    total_enrollment.student_id = ?