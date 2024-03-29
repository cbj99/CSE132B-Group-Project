INSERT INTO courses VALUES
    ('CSE1', 'letter_grade_only', 4, 'CSE', 1), 
    ('CSE2', 'S/U', 4, 'CSE', 1),
    ('CSE3', 'P/NP', 4, 'CSE', 1),
    ('CSE4', 'letter_grade_only', 4, 'CSE', 1),
    ('CSE5', 'letter_grade_only', 4, 'CSE', 1),
    ('CSE6', 'letter_grade_only', 4, 'CSE', 1); 

INSERT INTO coursePrequisite VALUES
    ('CSE6','CSE5'),
    ('CSE6','CSE4'),
    ('CSE4','CSE3');


UPDATE courses SET
    course_number='CSE55', grading_option = 'P/NP', unit=5, department='CSE', lab_required=0
    where course_number='CSE5';

DELETE FROM coursePrequisite where course_number='CSE6'; 


INSERT INTO classes VALUES('CSE1', 2021, 'fall', 1); 

INSERT INTO location VALUES('room_1', 'location_1'); 

INSERT INTO meetings VALUES('CSE1', 2021, 'fall', 1, 'LE', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'); 
INSERT INTO meetings VALUES('CSE1', 2021, 'fall', 1, 'LE', '2021-5-5', '12:00:00', '13:00:00', 'no', 'room_1', 'location_1'); 

http://localhost:8080/UseDatabase/classes.jsp?action=insert&COURSENUMBER=CSE1&YEAR=2021&QUARTER=fall&SECTION=1&TYPE=DI&DATE=2021-05-02&BEGINTIME=12%3A00%3A00&ENDTIME=13%3A00%3A00&MANDATORY=YES&ROOMNUMBER=room_1&BUILDINGNUMBER=location_1