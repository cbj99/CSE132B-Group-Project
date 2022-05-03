INSERT INTO faculty VALUES
    ('faculty_1', 'Assistant Professor', 'CSE'), 
    ('faculty_2', 'Distinguished Professor', 'Biology'), 
    ('faculty_3', 'Lecturer', 'physics'), 
    ('faculty_4', 'Assistant Professor', 'Math'),
    ('faculty_5', 'Appointed Professor', 'ECE'); 

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
    (5, 5, 'CA_resident', 'enrolled', 'fist_5', 'last_5', 'middle_5', 'computer science department'); 

INSERT INTO BSMSStudent VALUES 
    (2, 2, 'CA_resident', 'enrolled', 'fist_2', 'last_2', 'middle_2', 'computer science department'); 

INSERT INTO MSStudent VALUES 
    (3, 3, 'CA_resident', 'enrolled', 'fist_3', 'last_3', 'middle_2', 'computer science department'); 

INSERT INTO PHDPreCandidacyStudent VALUES 
    (4, 4, 'non_CA_resident', 'enrolled', 'fist_4', 'last_4', 'middle_4', 'computer science department'); 

INSERT INTO PHDCandidateStudent VALUES 
    (5, 5, 'CA_resident', 'enrolled', 'fist_5', 'last_5', 'middle_5', 'computer science department', 'faculty_1'), 
    (8, 8, 'CA_resident', 'enrolled', 'fist_8', 'last_8', 'middle_8', 'Math', 'faculty_4'); 

INSERT INTO probation VALUES
    (5, 2021, 'winter', 'UCSD', 'loooool'), 
    (1, 2021, 'fall', 'UCSD', 'lol'),
    (1, 2021, 'spring', 'UCSD', 'loooooool'); 

INSERT INTO location VALUES
    ('room_1', 'building_1'),
    ('room_2', 'building_1'),
    ('room_3', 'building_2'),
    ('room_4', 'building_2');

INSERT INTO degree_ VALUES
    ('CS26', 'UCSD', 'Computer Science', 'CSE'), 
    ('CS27', 'UCSD', 'Electrical Engineering', 'ECE'),
    ('Bio10', 'UCSD', 'Biology', 'Biology'), 
    ('CS26', 'USD', 'Computer Science', 'CSE'),

    ('CS266', 'UCSD', 'Computer Science', 'CSE'), 
    ('CS277', 'UCSD', 'Electrical Engineering', 'ECE'),
    ('Bio100', 'UCSD', 'Biology', 'Biology'), 
    ('CS266', 'USD', 'Computer Science', 'CSE'); 

INSERT INTO undergraduateDegree VALUES
    ('CS26', 'UCSD', 'Computer Science', 'CSE', 'BA', 10, 20), 
    ('CS27', 'UCSD', 'Electrical Engineering', 'ECE', 'BS', 15, 20),
    ('Bio10', 'UCSD', 'Biology', 'Biology', 'BS', 20, 30), 
    ('CS26', 'USD', 'Computer Science', 'CSE', 'BA', 20, 50);

INSERT INTO graduateDegree VALUES
    ('CS266', 'UCSD', 'Computer Science', 'CSE'), 
    ('CS277', 'UCSD', 'Electrical Engineering', 'ECE'),
    ('Bio100', 'UCSD', 'Biology', 'Biology'), 
    ('CS266', 'USD', 'Computer Science', 'CSE'); 

INSERT INTO courses VALUES
    ('CSE1', 'letter_grade_only', 4, 'CSE', 1), 
    ('CSE2', 'S/U', 4, 'CSE', 1),
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
    ('CSE1', 2021, 'fall', 1),
    ('CSE1', 2021, 'fall', 2), 
    ('CSE1', 2021, 'fall', 3),

    ('CSE2', 2021, 'fall', 1),
    ('CSE2', 2021, 'spring', 2), 
    ('CSE2', 2021, 'fall', 3),

    ('CSE3', 2021, 'fall', 1),
    ('CSE3', 2021, 'spring', 2), 
    ('CSE3', 2021, 'fall', 3),

    ('CSE4', 2021, 'fall', 1),
    ('CSE4', 2021, 'spring', 2), 
    ('CSE4', 2021, 'fall', 3),

    ('CSE5', 2021, 'fall', 1),
    ('CSE5', 2021, 'spring', 2), 
    ('CSE5', 2021, 'fall', 3),

    ('CSE6', 2021, 'fall', 1),
    ('CSE6', 2021, 'spring', 2), 
    ('CSE6', 2021, 'fall', 3),

INSERT INTO meetings VALUES
    ('CSE1', 2021, 'fall', 1, 'LE', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE1', 2021, 'fall', 2, 'LE', '2021-5-4', '12:00:00', '13:00:00', 'yes', 'room_2', 'location_2'),
    ('CSE1', 2021, 'fall', 1, 'LE', '2021-5-5', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE1', 2021, 'fall', 1, 'Revoew Session', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_3', 'location_3'),

    ('CSE2', 2021, 'fall', 1, 'LE', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE2', 2021, 'spring', 2, 'LE', '2021-5-4', '12:00:00', '13:00:00', 'yes', 'room_2', 'location_2'),
    ('CSE2', 2021, 'fall', 1, 'LE', '2021-5-5', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE2', 2021, 'fall', 1, 'Revoew Session', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_3', 'location_3'),

    ('CSE3', 2021, 'fall', 1, 'LE', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE3', 2021, 'spring', 2, 'LE', '2021-5-4', '12:00:00', '13:00:00', 'yes', 'room_2', 'location_2'),
    ('CSE3', 2021, 'fall', 1, 'LE', '2021-5-5', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE3', 2021, 'fall', 1, 'Revoew Session', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_3', 'location_3'),

    ('CSE4', 2021, 'fall', 1, 'LE', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE4', 2021, 'spring', 2, 'LE', '2021-5-4', '12:00:00', '13:00:00', 'yes', 'room_2', 'location_2'),
    ('CSE4', 2021, 'fall', 1, 'LE', '2021-5-5', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE4', 2021, 'fall', 1, 'Revoew Session', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_3', 'location_3'),

    ('CSE5', 2021, 'fall', 1, 'LE', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE5', 2021, 'spring', 2, 'LE', '2021-5-4', '12:00:00', '13:00:00', 'yes', 'room_2', 'location_2'),
    ('CSE5', 2021, 'fall', 1, 'LE', '2021-5-5', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE5', 2021, 'fall', 1, 'Revoew Session', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_3', 'location_3'),

    ('CSE6', 2021, 'fall', 1, 'LE', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE6', 2021, 'spring', 2, 'LE', '2021-5-4', '12:00:00', '13:00:00', 'yes', 'room_2', 'location_2'),
    ('CSE6', 2021, 'fall', 1, 'LE', '2021-5-5', '12:00:00', '13:00:00', 'yes', 'room_1', 'location_1'),
    ('CSE6', 2021, 'fall', 1, 'Revoew Session', '2021-5-2', '12:00:00', '13:00:00', 'yes', 'room_3', 'location_3'); 

INSERT INTO course_offering_ny VALUES
    ('faculty_1', 'CSE1', 2022, 'fall', 1), 
    ('faculty_1', 'CSE1', 2022, 'fall', 2),
    ('faculty_1', 'CSE1', 2022, 'fall', 3),

    ('faculty_2', 'CSE2', 2022, 'fall', 1)), 
    ('faculty_3', 'CSE3', 2022, 'fall', 1), 
    ('faculty_4', 'CSE4', 2022, 'fall', 1),

    ('faculty_5', 'CSE5', 2022, 'fall', 1),
    ('faculty_5', 'CSE5', 2022, 'fall', 2);

