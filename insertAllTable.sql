INSERT INTO student VALUES 
    (1, 1, 'CA_resident', 'enrolled', 'fist_1', 'last_1', 'middle_1'),
    (2, 2, 'non_CA_resident', 'enrolled', 'fist_2', 'last_2', 'middle_2'),
    (3, 3, 'CA_resident', 'enrolled', 'fist_3', 'last_3', 'middle_3'),
    (4, 4, 'non_CA_resident', 'enrolled', 'fist_4', 'last_4', 'middle_4'),
    (5, 5, 'CA_resident', 'enrolled', 'fist_5', 'last_5', 'middle_5'),
    (6, 6, 'CA_resident', 'enrolled', 'fist_6', 'last_6', 'middle_6'), 
    (7, 7, 'non_CA_resident', 'enrolled', 'fist_7', 'last_7', 'middle_7'),
    (8, 8, 'CA_resident', 'enrolled', 'fist_8', 'last_8', 'middle_8'); 

INSERT INTO undergraduateStudent VALUES 
    (1, 1, 'CA_resident', 'enrolled', 'fist_1', 'last_1', 'middle_1', 'CS', NULL, 'sixth'), 
    (6, 6, 'CA_resident', 'enrolled', 'fist_6', 'last_6', 'middle_6', 'Biology', NULL, 'Warren'),
    (7, 7, 'non_CA_resident', 'enrolled', 'fist_7', 'last_7', 'middle_7', 'Biology', NULL, 'Warren');

INSERT INTO graduateStudent VALUES 
    (2, 2, 'CA_resident', 'enrolled', 'fist_2', 'last_2', 'middle_2', 'computer science department'),
    (3, 3, 'CA_resident', 'enrolled', 'fist_3', 'last_3', 'middle_2', 'computer science department'),
    (4, 4, 'non_CA_resident', 'enrolled', 'fist_4', 'last_4', 'middle_4', 'computer science department'),
    (5, 5, 'CA_resident', 'enrolled', 'fist_5', 'last_5', 'middle_5', 'computer science department'),
    (8, 8, 'CA_resident', 'enrolled', 'fist_8', 'last_8', 'middle_8', 'math department'); 

INSERT INTO BSMSStudent VALUES 
    (2, 2, 'CA_resident', 'enrolled', 'fist_2', 'last_2', 'middle_2', 'computer science department'); 

INSERT INTO MSStudent VALUES 
    (3, 3, 'CA_resident', 'enrolled', 'fist_3', 'last_3', 'middle_2', 'computer science department'); 

INSERT INTO PHDPreCandidacyStudent VALUES 
    (4, 4, 'non_CA_resident', 'enrolled', 'fist_4', 'last_4', 'middle_4', 'computer science department'); 

INSERT INTO faculty VALUES
    ('faculty_1', 'Assistant Professor', 'CSE'), 
    ('faculty_2', 'Distinguished Professor', 'Biology'), 
    ('faculty_3', 'Lecturer', 'physics'), 
    ('faculty_4', 'Assistant Professor', 'Math'),
    ('faculty_5', 'Appointed Professor', 'ECE'); 

INSERT INTO PHDCandidateStudent VALUES 
    (5, 5, 'CA_resident', 'enrolled', 'fist_5', 'last_5', 'middle_5', 'computer science department', 'faculty_1'), 
    (8, 8, 'CA_resident', 'enrolled', 'fist_8', 'last_8', 'middle_8', 'math department', 'faculty_4'); 

INSERT INTO probation VALUES
    (5, 2021, 'winter', 'UCSD', 'too stupid'), 
    (1, 2021, 'fall', 'UCSD', 'too smart'),
    (1, 2021, 'spring', 'UCSD', 'nobody cares'); 

INSERT INTO location_ VALUES
    ('room_1', 'building_1', 100),
    ('room_2', 'building_1', 20),
    ('room_3', 'building_2', 40),
    ('room_4', 'building_2', 50);

INSERT INTO degree_ VALUES
    ('CS26', 'UCSD', 'Computer Science', 'CSE'), 
    ('EE27', 'UCSD', 'Electrical Engineering', 'ECE'),
    ('BIO10', 'UCSD', 'Biology', 'Biology'), 
    ('CS26', 'USD', 'Computer Science', 'CSE'),
    ('CS266', 'UCSD', 'Computer Science', 'CSE'), 
    ('EE277', 'UCSD', 'Electrical Engineering', 'ECE'),
    ('BIO100', 'UCSD', 'Biology', 'Biology'), 
    ('CS266', 'USD', 'Computer Science', 'CSE'); 

INSERT INTO undergraduateDegree VALUES
    ('CS26', 'UCSD', 'Computer Science', 'CSE', 'BA', 10, 20), 
    ('EE27', 'UCSD', 'Electrical Engineering', 'ECE', 'BS', 15, 20),
    ('BIO10', 'UCSD', 'Biology', 'Biology', 'BS', 20, 30), 
    ('CS26', 'USD', 'Computer Science', 'CSE', 'BA', 20, 50);

INSERT INTO graduateDegree VALUES
    ('CS266', 'UCSD', 'Computer Science', 'CSE'), 
    ('EE277', 'UCSD', 'Electrical Engineering', 'ECE'),
    ('BIO100', 'UCSD', 'Biology', 'Biology'), 
    ('CS266', 'USD', 'Computer Science', 'CSE'); 

INSERT INTO courses VALUES
    ('CSE1', 'letter_grade_only', 4, 'CSE', 1), 
    ('CSE2', 'letter_grade_only', 4, 'CSE', 1),
    ('CSE3', 'P/NP', 4, 'CSE', 1),
    ('CSE4', 'letter_grade_only', 4, 'CSE', 1),
    ('CSE5', 'P/NP', 4, 'CSE', 1),
    ('CSE6', 'letter_grade_only', 4, 'CSE', 1); 

INSERT INTO coursePrequisite VALUES
    ('CSE6','CSE5'),
    ('CSE6','CSE4'),
    ('CSE4','CSE3'), 
    ('CSE5','CSE3'), 
    ('CSE5','CSE4'); 

INSERT INTO classes VALUES
    ('CSE1', 2021, 'winter', 1),
    ('CSE1', 2021, 'spring', 2), 
    ('CSE1', 2021, 'fall', 3),
    ('CSE1', 2018, 'spring', 2),

    ('CSE2', 2021, 'winter', 1),
    ('CSE2', 2021, 'spring', 2), 
    ('CSE2', 2021, 'fall', 3),
    ('CSE2', 2018, 'spring', 2),

    ('CSE3', 2021, 'winter', 1),
    ('CSE3', 2021, 'spring', 2), 
    ('CSE3', 2021, 'fall', 3),
    ('CSE3', 2018, 'spring', 2),

    ('CSE4', 2021, 'winter', 1),
    ('CSE4', 2021, 'spring', 2), 
    ('CSE4', 2021, 'fall', 3),
    ('CSE4', 2018, 'spring', 2),

    ('CSE5', 2021, 'winter', 1),
    ('CSE5', 2021, 'spring', 2), 
    ('CSE5', 2021, 'fall', 3),
    ('CSE5', 2018, 'spring', 2),

    ('CSE6', 2021, 'winter', 1),
    ('CSE6', 2021, 'spring', 2), 
    ('CSE6', 2021, 'fall', 3),
    ('CSE6', 2018, 'spring', 2);

INSERT INTO meetings VALUES
    ('CSE1', 2021, 'winter', 1, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE1', 2021, 'winter', 1, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1'),
    ('CSE1', 2021, 'winter', 1, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE1', 2021, 'winter', 1, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2'),

    ('CSE2', 2021, 'spring', 2, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE2', 2021, 'spring', 2, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1'),
    ('CSE2', 2021, 'spring', 2, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE2', 2021, 'spring', 2, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2'),

    ('CSE3', 2021, 'fall', 3, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE3', 2021, 'fall', 3, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1'),
    ('CSE3', 2021, 'fall', 3, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE3', 2021, 'fall', 3, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2'),

    ('CSE4', 2021, 'winter', 1, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE4', 2021, 'winter', 1, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1'),
    ('CSE4', 2021, 'winter', 1, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE4', 2021, 'winter', 1, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2'),

    ('CSE5', 2021, 'spring', 2, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE5', 2021, 'spring', 2, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1'),
    ('CSE5', 2021, 'spring', 2, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE5', 2021, 'spring', 2, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2'),

    ('CSE6', 2021, 'fall', 3, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE6', 2021, 'fall', 3, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1'),
    ('CSE6', 2021, 'fall', 3, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1'),
    ('CSE6', 2021, 'fall', 3, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2'); 

INSERT INTO course_offering_ny VALUES
    ('faculty_1', 'CSE1', 2022, 'fall', 1), 
    ('faculty_1', 'CSE1', 2022, 'fall', 2),
    ('faculty_1', 'CSE1', 2022, 'fall', 3),

    ('faculty_2', 'CSE2', 2022, 'fall', 1), 
    ('faculty_3', 'CSE3', 2022, 'fall', 1), 
    ('faculty_4', 'CSE4', 2022, 'fall', 1),

    ('faculty_5', 'CSE5', 2022, 'fall', 1),
    ('faculty_5', 'CSE5', 2022, 'fall', 2);

INSERT INTO degreeRecord VALUES
    (1, 'CS26', 'UCSD', 'INPROGRESS'),
    (6, 'BIO10', 'UCSD', 'INPROGRESS'),
    (7, 'BIO10', 'UCSD', 'INPROGRESS'),
    (2, 'CS26', 'UCSD', 'EARNED'),
    (3, 'CS26', 'UCSD', 'EARNED'),
    (4, 'CS26', 'UCSD', 'EARNED'),
    (5, 'CS26', 'UCSD', 'EARNED'),
    (8, 'EE27', 'UCSD', 'EARNED');

INSERT INTO gradudateDegreeRequiarment VALUES
    ('CS266', 'UCSD', 'CSE1', 'YES', 'AL'),
    ('CS266', 'UCSD', 'CSE2', 'NO', 'OS'),
    ('CS266', 'UCSD', 'CSE3', 'YES', 'ML'),
    ('CS266', 'UCSD', 'CSE4', 'NO', 'DS'),
    ('CS266', 'UCSD', 'CSE5', 'YES', 'DB');

INSERT INTO underGradudateDegreeRequiarment VALUES
    ('CS26', 'UCSD', 'CSE1', 'YES', 'NO', 'YES', 'NO', 4),
    ('CS26', 'UCSD', 'CSE2', 'NO', 'YES', 'NO', 'YES', 4),
    ('CS26', 'UCSD', 'CSE3', 'YES', 'NO', 'YES', 'NO', 4),
    ('CS26', 'UCSD', 'CSE4', 'NO', 'YES', 'NO', 'YES', 4),
    ('CS26', 'UCSD', 'CSE5', 'YES', 'NO', 'YES', 'NO', 4);

INSERT INTO enrollment VALUES
    (1, 'CSE1', 2021, 'winter', 1, 'faculty_1', 'COMPLETED', 'A+'),
    (1, 'CSE1', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'INPROGRESS'),
    (2, 'CSE2', 2018, 'spring', 2, 'faculty_2', 'COMPLETED', 'C-'),
    (3, 'CSE3', 2021, 'fall', 3, 'faculty_3', 'INPROGRESS', 'INPROGRESS'),
    (3, 'CSE3', 2018, 'spring', 2, 'faculty_3', 'INPROGRESS', 'INPROGRESS'),
    (4, 'CSE4', 2021, 'winter', 1, 'faculty_3', 'COMPLETED', 'W'),
    (4, 'CSE4', 2018, 'spring', 2, 'faculty_3', 'COMPLETED', 'W'),
    (5, 'CSE5', 2018, 'spring', 2, 'faculty_4', 'COMPLETED', 'Pass'),
    (6, 'CSE6', 2021, 'fall', 3, 'faculty_5', 'COMPLETED', 'F');

INSERT INTO past_enrollment VALUES
    (3, 'CSE6', 2021, 'winter', 'A+'),
    (4, 'CSE5', 2021, 'spring', 'C-'),
    (5, 'CSE4', 2021, 'fall', 'Not Pass'),
    (6, 'CSE3', 2021, 'winter', 'W'),
    (7, 'CSE2', 2021, 'spring', 'Pass'),
    (8, 'CSE1', 2021, 'fall', 'F');

INSERT INTO thesisCommittee VALUES
    (2, 'faculty_1'),
    (3, 'faculty_2'),
    (4, 'faculty_3'),
    (5, 'faculty_4'),
    (8, 'faculty_5');

