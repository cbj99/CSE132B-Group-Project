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
    grading_option = 'P/NP', unit=5, department='CSE', lab_required=0
    where course_number='CSE6'

DELETE FROM coursePrequisite where course_number='CSE6'; 