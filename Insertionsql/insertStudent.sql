/**
    Create faculty table
*/ 
INSERT INTO faculty VALUES
    ('faculty_1', 'Assistant Professor', 'computer science'); 

INSERT INTO student VALUES 
    (1, 1, 'CA_resident', 'enrolled', 'fist_1', 'last_1', 'middle_1'),
    (2, 2, 'non_CA_resident', 'enrolled', 'fist_2', 'last_2', 'middle_2'),
    (3, 3, 'CA_resident', 'enrolled', 'fist_3', 'last_3', 'middle_3'),
    (4, 4, 'non_CA_resident', 'enrolled', 'fist_4', 'last_4', 'middle_4'),
    (5, 5, 'CA_resident', 'enrolled', 'fist_5', 'last_5', 'middle_5');

INSERT INTO undergraduateStudent VALUES 
    (1, 1, 'CA_resident', 'enrolled', 'fist_1', 'last_1', 'middle_1', 'CS', NULL, 'sixth'); 

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
    (5, 5, 'CA_resident', 'enrolled', 'fist_5', 'last_5', 'middle_5', 'computer science department', 'faculty_1'); 


UPDATE student SET student_id = 11, SSN = 100, identity_='non_CA_resident', enrollment_status='graduated', first_name='first_1_modified', last_name = 'last_1_modified', middle_name='middle_1_modified' where student_id=1;

UPDATE undergraduateStudent SET SSN = 100, identity_='non_CA_resident', enrollment_status='graduated', first_name='first_1_modified', last_name = 'last_1_modified', middle_name='middle_1_modified', major='biology', minor='applied_minor', college='seventh' where student_id=1;


DELETE FROM student 
where student_id = 1; 