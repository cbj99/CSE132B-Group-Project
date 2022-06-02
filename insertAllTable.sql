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
    ('CS266', 'USD', 'Computer Science', 'CSE')
    ON CONFLICT DO NOTHING; 

INSERT INTO undergraduateDegree VALUES
    ('CS26', 'UCSD', 'Computer Science', 'CSE', 'BA', 10, 20, 20, 10, 10, 8), 
    ('EE27', 'UCSD', 'Electrical Engineering', 'ECE', 'BS', 15, 20, 20, 10, 10, 8),
    ('BIO10', 'UCSD', 'Biology', 'Biology', 'BS', 20, 30, 20, 10, 10, 8), 
    ('CS26', 'USD', 'Computer Science', 'CSE', 'BA', 20, 50, 20, 10, 10, 8)
    ON CONFLICT DO NOTHING; 

INSERT INTO graduateDegree VALUES
    ('CS266', 'UCSD', 'Computer Science', 'CSE', 20), 
    ('EE277', 'UCSD', 'Electrical Engineering', 'ECE', 30),
    ('BIO100', 'UCSD', 'Biology', 'Biology', 20), 
    ('CS266', 'USD', 'Computer Science', 'CSE', 20); 

INSERT INTO courses VALUES
    ('CSE1', 'letter_grade_only', 4, 'CSE', 1, 0, 'Fluency in Information Technology'), 
    ('CSE2', 'letter_grade_only', 4, 'CSE', 1, 0, 'Basic Data Structures and Object-Oriented Design'),
    ('CSE3', 'P/NP', 4, 'CSE', 1, 0, 'Discrete Mathematics'),
    ('CSE4', 'letter_grade_only', 4, 'CSE', 1, 0, 'Mathematics for Algorithms and Systems'),
    ('CSE5', 'P/NP', 4, 'CSE', 1, 0, 'Computer Organization and Systems Programming'),
    ('CSE6', 'letter_grade_only', 4, 'CSE', 1, 0, 'C++ for Java Programmers'),
    ('CSE100', 'letter_grade_only', 4, 'CSE', 1, 1, 'Advanced Data Structures'), 
    ('CSE101', 'letter_grade_only', 4, 'CSE', 1, 1, 'Design and Analysis of Algorithms'),
    ('CSE102', 'letter_grade_only', 4, 'CSE', 1, 1, 'A Practical Introduction to Probability and Statistics'),
    -- ('CSE1', 'letter_grade_only', 4, 'CSE', 1, 0), 
    -- ('CSE2', 'letter_grade_only', 4, 'CSE', 1, 0),
    -- ('CSE3', 'P/NP', 4, 'CSE', 1, 0),
    -- ('CSE4', 'letter_grade_only', 4, 'CSE', 1, 0),
    -- ('CSE5', 'P/NP', 4, 'CSE', 1, 0),
    -- ('CSE6', 'letter_grade_only', 4, 'CSE', 1, 0),
    -- ('CSE100', 'letter_grade_only', 4, 'CSE', 1, 1), 
    -- ('CSE101', 'letter_grade_only', 4, 'CSE', 1, 1),
    -- ('CSE102', 'letter_grade_only', 4, 'CSE', 1, 1),
    -- ('CSE200', 'letter_grade_only', 4, 'CSE', 1, 2),
    -- ('CSE201', 'letter_grade_only', 4, 'CSE', 1, 2),
    -- ('CSE202', 'letter_grade_only', 4, 'CSE', 1, 2)
    ON CONFLICT DO NOTHING;

INSERT INTO coursePrequisite VALUES
    ('CSE6','CSE5'),
    ('CSE6','CSE4'),
    ('CSE4','CSE3'), 
    ('CSE5','CSE3'), 
    ('CSE5','CSE4'),
    ('CSE101','CSE100')
    ;

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
    ('CSE6', 2018, 'spring', 2),
    
    ('CSE100', 2021, 'winter', 1),
    ('CSE100', 2021, 'spring', 2), 
    ('CSE100', 2021, 'fall', 3),
    ('CSE100', 2018, 'spring', 2),

    ('CSE101', 2021, 'winter', 1),
    ('CSE101', 2021, 'spring', 2), 
    ('CSE101', 2021, 'fall', 3),
    ('CSE101', 2018, 'spring', 2),

    ('CSE102', 2021, 'winter', 1),
    ('CSE102', 2021, 'spring', 2), 
    ('CSE102', 2021, 'fall', 3),
    ('CSE102', 2018, 'spring', 2),

    ('CSE200', 2021, 'winter', 1),
    ('CSE200', 2021, 'spring', 2), 
    ('CSE200', 2021, 'fall', 3),
    ('CSE200', 2018, 'spring', 2),

    ('CSE201', 2021, 'winter', 1),
    ('CSE201', 2021, 'spring', 2), 
    ('CSE201', 2021, 'fall', 3),
    ('CSE201', 2018, 'spring', 2),

    ('CSE202', 2021, 'winter', 1),
    ('CSE202', 2021, 'spring', 2), 
    ('CSE202', 2021, 'fall', 3),
    ('CSE202', 2018, 'spring', 2)
    ;

INSERT INTO meetings VALUES
    ('CSE1', 2021, 'winter', 1, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE1', 2021, 'winter', 1, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE1', 2021, 'winter', 1, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE1', 2021, 'winter', 1, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE2', 2021, 'spring', 2, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE2', 2021, 'spring', 2, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE2', 2021, 'spring', 2, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE2', 2021, 'spring', 2, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE3', 2021, 'fall', 3, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE3', 2021, 'fall', 3, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE3', 2021, 'fall', 3, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE3', 2021, 'fall', 3, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE4', 2021, 'winter', 1, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE4', 2021, 'winter', 1, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE4', 2021, 'winter', 1, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE4', 2021, 'winter', 1, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE5', 2021, 'spring', 2, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE5', 2021, 'spring', 2, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE5', 2021, 'spring', 2, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE5', 2021, 'spring', 2, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE6', 2021, 'fall', 3, 'Lecture', '2021-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE6', 2021, 'fall', 3, 'Discussion', '2021-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE6', 2021, 'fall', 3, 'Lab', '2021-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE6', 2021, 'fall', 3, 'Review Session', '2021-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),
	
	('CSE1', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE1', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE1', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE1', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE2', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE2', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE2', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE2', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE3', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE3', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE3', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE3', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE4', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE4', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE4', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE4', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE5', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE5', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE5', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE5', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),

    ('CSE6', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE6', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE6', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE6', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),
	
	('CSE100', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE100', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE100', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE100', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),
	
	('CSE101', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE101', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE101', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE101', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1'),
	
	('CSE102', 2018, 'spring', 2, 'Lecture', '2018-5-2', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE102', 2018, 'spring', 2, 'Discussion', '2018-5-4', '12:00:00', '13:00:00', 'NO', 'room_2', 'building_1', 'faculty_1'),
    ('CSE102', 2018, 'spring', 2, 'Lab', '2018-5-5', '12:00:00', '13:00:00', 'YES', 'room_1', 'building_1', 'faculty_1'),
    ('CSE102', 2018, 'spring', 2, 'Review Session', '2018-5-2', '12:00:00', '13:00:00', 'NO', 'room_3', 'building_2', 'faculty_1');

INSERT INTO course_offering_ny VALUES
    ('Faculty1', 'CSE000', 2022, 'fall', 1, 'Fluency in Information Technology')
    -- ('faculty_1', 'CSE1', 2022, 'fall', 1, 'Fluency in Information Technology'), 
    -- ('faculty_1', 'CSE1', 2022, 'fall', 2, 'Fluency in Information Technology'),
    -- ('faculty_1', 'CSE1', 2022, 'fall', 3, 'Fluency in Information Technology'),
    
    -- ('faculty_2', 'CSE2', 2022, 'fall', 1, 'Basic Data Structures and Object-Oriented Design'), 
    -- ('faculty_3', 'CSE3', 2022, 'fall', 1, 'Discrete Mathematics'), 
    -- ('faculty_4', 'CSE4', 2022, 'fall', 1, 'Mathematics for Algorithms and Systems'),

    -- ('faculty_5', 'CSE5', 2022, 'fall', 1, 'Computer Organization and Systems Programming'),
    -- ('faculty_5', 'CSE5', 2022, 'fall', 2, 'Computer Organization and Systems Programming'),
    -- ('faculty_1', 'CSE1', 2021, 'fall', 1), 
    -- ('faculty_1', 'CSE1', 2022, 'fall', 1), 
    -- ('faculty_1', 'CSE1', 2022, 'fall', 2),
    -- ('faculty_1', 'CSE1', 2022, 'fall', 3),
    -- ('faculty_1', 'CSE1', 2022, 'winter', 3),

    -- ('faculty_2', 'CSE2', 2022, 'fall', 1), 
    -- ('faculty_3', 'CSE2', 2022, 'winter', 1), 

    -- ('faculty_4', 'CSE4', 2022, 'fall', 1),
    -- ('faculty_4', 'CSE4', 2022, 'winter', 1),
    -- ('faculty_4', 'CSE4', 2022, 'spring', 1),

    -- ('faculty_5', 'CSE100', 2022, 'fall', 1),

    -- ('faculty_5', 'CSE5', 2022, 'fall', 1),
    -- ('faculty_5', 'CSE5', 2022, 'winter', 2),
    -- ('faculty_5', 'CSE5', 2022, 'fall', 2)
    ON CONFLICT DO NOTHING;
    
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
    ('CS266', 'UCSD', 'CSE100', 'YES', 'AL'),
    ('CS266', 'UCSD', 'CSE2', 'NO', 'OS'),
    ('CS266', 'UCSD', 'CSE3', 'YES', 'ML'),
    ('CS266', 'UCSD', 'CSE4', 'NO', 'DS'),
    ('CS266', 'UCSD', 'CSE5', 'YES', 'DB'),
    ('CS266', 'UCSD', 'CSE200', 'YES', 'General CS'),
    ('CS266', 'UCSD', 'CSE201', 'YES', 'General CS')
    ON CONFLICT DO NOTHING;

INSERT INTO underGradudateDegreeRequiarment VALUES
    ('CS26', 'UCSD', 'CSE1', 'YES', 'NO', 'YES', 'NO', 4),
    ('CS26', 'UCSD', 'CSE2', 'NO', 'YES', 'NO', 'YES', 4),
    ('CS26', 'UCSD', 'CSE3', 'YES', 'NO', 'YES', 'NO', 4),
    ('CS26', 'UCSD', 'CSE4', 'NO', 'YES', 'NO', 'YES', 4),
    ('CS26', 'UCSD', 'CSE5', 'YES', 'NO', 'YES', 'NO', 4),
    ('CS26', 'UCSD', 'CSE6', 'YES', 'YES', 'YES', 'YES', 4),
    ('CS26', 'UCSD', 'CSE100', 'YES', 'YES', 'YES', 'YES', 4),
    ('CS26', 'UCSD', 'CSE101', 'YES', 'YES', 'YES', 'YES', 4),
    ('CS26', 'UCSD', 'CSE102', 'YES', 'YES', 'YES', 'YES', 4)
    ON CONFLICT DO NOTHING; 

INSERT INTO enrollment VALUES
    (1, 'CSE1', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'A'),
    (1, 'CSE2', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'A+'),
    (1, 'CSE3', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'B+'),
    (1, 'CSE4', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'A'),
    (1, 'CSE5', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),
    (1, 'CSE6', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A-'),
    (1, 'CSE1', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A+'),
    (1, 'CSE100', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),
    (1, 'CSE101', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'C'),
    (1, 'CSE102', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'B'),

    (2, 'CSE1', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'A-'),
    (2, 'CSE2', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'A-'),
    (2, 'CSE3', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'B-'),
    (2, 'CSE4', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'A+'),
    (2, 'CSE5', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'C'),
    (2, 'CSE6', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'C-'),
    (2, 'CSE1', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'B+'),
    (2, 'CSE100', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'B'),
    (2, 'CSE101', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A+'),
    (2, 'CSE102', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),

    (3, 'CSE1', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'B'),
    (3, 'CSE2', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'B-'),
    (3, 'CSE3', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'B+'),
    (3, 'CSE4', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'A+'),
    (3, 'CSE5', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A+'),
    (3, 'CSE6', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'C'),
    (3, 'CSE1', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'B'),
    (3, 'CSE100', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'D'),
    (3, 'CSE101', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A+'),
    (3, 'CSE102', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),

    (4, 'CSE1', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'A+'),
    (4, 'CSE2', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'A+'),
    (4, 'CSE3', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'A+'),
    (4, 'CSE4', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'A-'),
    (4, 'CSE5', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),
    (4, 'CSE6', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'B+'),
    (4, 'CSE1', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),
    (4, 'CSE100', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'C'),
    (4, 'CSE101', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'C'),
    (4, 'CSE102', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),

    (5, 'CSE1', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'C'),
    (5, 'CSE2', 2021, 'winter', 1, 'faculty_1', 'INPROGRESS', 'C'),
    (5, 'CSE3', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'A+'),
    (5, 'CSE4', 2021, 'fall', 3, 'faculty_1', 'INPROGRESS', 'A-'),
    (5, 'CSE5', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A+'),
    (5, 'CSE6', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A-'),
    (5, 'CSE1', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),
    (5, 'CSE100', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'A'),
    (5, 'CSE101', 2021, 'spring', 2, 'faculty_1', 'INPROGRESS', 'C+'),
    (5, 'CSE102', 2018, 'spring', 2, 'faculty_1', 'INPROGRESS', 'B-')
    ON CONFLICT DO NOTHING;


INSERT INTO past_enrollment VALUES
    (3, 'CSE6', 2021, 'winter', 1, 'faculty_1',  'A+'),
    (3, 'CSE3', 2021, 'winter', 1, 'faculty_1',  'A+'),
    (3, 'CSE200', 2021, 'winter', 1, 'faculty_1',  'A+'),
    (3, 'CSE201', 2021, 'winter', 1, 'faculty_1',  'A+'),
    (3, 'CSE202', 2021, 'winter', 1, 'faculty_1',  'B'),
    
    (3, 'CSE5', 2018, 'spring', 2, 'faculty_1',  'A+'),
    (3, 'CSE5', 2018, 'spring', 1, 'faculty_1',  'A+'),
    (3, 'CSE5', 2018, 'spring', 3, 'faculty_1',  'A+'),
    (5, 'CSE5', 2021, 'spring', 2, 'faculty_1',  'A+'),
    (1, 'CSE5', 2021, 'spring', 2, 'faculty_1',  'A+'), 

    (4, 'CSE5', 2021, 'spring', 2, 'faculty_1', 'C-'),
    (2, 'CSE5', 2021, 'winter', 1, 'faculty_1', 'C-'),
    (2, 'CSE5', 2021, 'spring', 2, 'faculty_1', 'C-'),
    (1, 'CSE5', 2021, 'winter', 1, 'faculty_2', 'C-'),

    (5, 'CSE4', 2021, 'fall', 3, 'faculty_2',  'Not Pass'),
    (6, 'CSE3', 2021, 'winter', 1, 'faculty_2',  'W'),
    (7, 'CSE2', 2021, 'spring', 2, 'faculty_3',  'Pass'),
    (8, 'CSE1', 2021, 'fall', 3, 'faculty_3',  'F'),
    (7, 'CSE1', 2021, 'fall', 3, 'faculty_3',  'F')
    ON CONFLICT DO NOTHING;

INSERT INTO thesisCommittee VALUES
    (2, 'faculty_1'),
    (3, 'faculty_2'),
    (4, 'faculty_3'),
    (5, 'faculty_4'),
    (8, 'faculty_5');

insert into grade_conversion values('A+', 4.3);
insert into grade_conversion values('A', 4);
insert into grade_conversion values('A-', 3.7);
insert into grade_conversion values('B+', 3.4);
insert into grade_conversion values('B', 3.1);
insert into grade_conversion values('B-', 2.8);
insert into grade_conversion values('C+', 2.5);
insert into grade_conversion values('C', 2.2);
insert into grade_conversion values('C-', 1.9);
insert into grade_conversion values('D', 1.6);