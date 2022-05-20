WITH student_in_this_section as(
	select student_id 
	from enrollment 
	where year_=2018 and quarter = 'spring' and course_number = 'CSE1' and section_id = 2
),
all_section_of_all_student_in_this_section as (select distinct m.date_, m.begin_time, m.end_time 
	from meetings m
	where m.year_=2018 and m.quarter = 'spring' 
	and exists(
		select * from enrollment e
		where m.year_=e.year_ and m.quarter = e.quarter
		and m.course_number = e.course_number and m.section_id = e.section_id
		and e.student_id in (select * from student_in_this_section))
),
date_choice as (SELECT t.day::date 
	FROM generate_series(  '2018-05-01',   '2018-05-05', interval  '1 day') AS t(day) 
	order by t.day::date
),
time_choice as (SELECT distinct t.time::time 
	FROM generate_series(  '2004-03-07',   '2004-08-16', interval  '1 hour') AS t(time) 
	order by t.time::time
),
date_time_choice as ( select distinct date_choice.day, time_choice.time as begin_time, time_choice.time+interval '1 hour' as end_time 
	from date_choice, time_choice 
	order by date_choice.day, time_choice.time
)
select d.day, d.begin_time, d.end_time
from date_time_choice d
where d.begin_time >= '08:00:00' and d.end_time <= '20:00:00'
and d.begin_time <> '23:00:00' and d.end_time <> '00:00:00' 
and not exists(
	select a.date_, a.begin_time, a.end_time
	from all_section_of_all_student_in_this_section a
	where a.date_ = d.day
	and (a.begin_time, a.end_time) overlaps (d.begin_time, d.end_time)
);