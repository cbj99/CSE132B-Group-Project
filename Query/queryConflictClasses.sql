WITH class_enrolled AS(
SELECT course_number 
FROM enrollment
WHERE student_id = 1 AND year_ = 2018 AND quarter = 'spring'
), total_conflict AS(
SELECT DISTINCT c.course_number, m2.type_, m1.begin_time, m1.end_time, e.course_number AS conflict_course
FROM classes c, enrollment e, meetings m1, meetings m2
WHERE c.year_ = 2018 AND c.quarter = 'spring' 
AND c.course_number NOT IN (SELECT * FROM class_enrolled)
AND e.course_number IN (SELECT * FROM class_enrolled)
AND m1.type_ <> 'Review Session' AND m2.type_ <> 'Review Session' 
AND c.year_ = e.year_ AND c.quarter = e.quarter AND c.course_number <> e.course_number
AND c.year_ = m1.year_ AND c.quarter = m1.quarter AND c.section_id = m1.section_id AND c.course_number = m1.course_number
AND e.year_ = m2.year_ AND e.quarter = m2.quarter AND e.section_id = m2.section_id AND e.course_number = m2.course_number
AND m1.date_ = m2.date_ 
AND (m1.end_time > m2.begin_time OR m2.end_time > m1.begin_time 
	 OR (m1.end_time <= m2.end_time AND m1.begin_time >= m2.begin_time)
	 OR (m2.end_time <= m1.end_time AND m2.begin_time >= m1.begin_time))
)
SELECT total_conflict.course_number, courses.course_title, type_, begin_time, end_time, string_agg(conflict_course, ', ' ORDER BY conflict_course) AS conflict_courses
FROM total_conflict, courses
WHERE total_conflict.course_number = courses.course_number
GROUP BY total_conflict.course_number, courses.course_title, type_, begin_time, end_time;


