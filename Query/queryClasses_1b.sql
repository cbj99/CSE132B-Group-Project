/* 
    supposing only displaying all studnets who are taking the classes this quarter meaning year = 2018, quarter = Spring 
*/ 

/*
    showing information about classes
*/ 
SELECT *
FROM classes
where classes.course_number = 'CSE1';
/*
    showing students who are taking the classes(roster) 
    along with grading option and and units 
*/ 
SELECT enrollment.student_id, student.first_name, student.last_name, enrollment.course_number, enrollment.year_, enrollment.quarter, enrollment.section_id, enrollment.faculty_name, courses.unit, courses.grading_option
FROM enrollment, courses, student
WHERE enrollment.course_number = 'CSE1' and enrollment.year_ = 2018 and enrollment.quarter='spring' and courses.course_number = 'CSE1' and student.student_id = enrollment.student_id;