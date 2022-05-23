-- 4. Any course inserted with 1xx is upper div, and any course inserted with 0xx is lower div, any course could be an elective

INSERT INTO degree_ VALUES
    -- #1
    ('CS26', 'UCSD', 'Computer Science', 'CSE'), 
    -- #2
    ('MA1', 'UCSD', 'Mathematics', 'MATH'), 
    -- #3
    ('CS266', 'UCSD', 'Computer Science', 'CSE'), 
    ('MA111', 'UCSD', 'Mathematics', 'MATH')
    ON CONFLICT DO NOTHING;


INSERT INTO undergraduateDegree VALUES
    -- #1
    ('CS26', 'UCSD', 'Computer Science', 'CSE', 'BS', 12, 12, 20, 8, 20, 20),
    -- #2
    ('MA1', 'UCSD', 'Mathematics', 'MATH', 'BS', 8, 16, 20, 12, 20, 20)
    ON CONFLICT DO NOTHING; 

-- #3
INSERT INTO graduateDegree VALUES
    ('CS266', 'UCSD', 'Computer Science', 'CSE', 20), 
    ('MA111', 'UCSD', 'Mathematics', 'MATH', 20)
    ON CONFLICT DO NOTHING;

-- #3  
INSERT INTO gradudateDegreeRequiarment VALUES
    ('CS266', 'UCSD', 'CSE132A', 'YES', 'Database Concentration'),
    ('CS266', 'UCSD', '', 'YES', 'System Concentration'),
    ('MA111', 'UCSD', '', 'YES', 'Number Theory'),
    ('MA111', 'UCSD', '', 'YES', 'Calculus')
    ON CONFLICT DO NOTHING;


INSERT INTO student VALUES 
    -- #5
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student1', 'student1', 'student1'),
    -- #6
    (222222222, 222222222, 'CA_resident', 'enrolled', 'student2', 'student2', 'student2'),
    -- #7
    (333333333, 333333333, 'CA_resident', 'enrolled', 'student3', 'student3', 'student3'),
    -- #29
    (444444444, 444444444, 'CA_resident', 'enrolled', 'student4', 'student4', 'student4'),
    -- #30
    (555555555, 555555555, 'CA_resident', 'enrolled', 'student5', 'student5', 'student5')
    -- #41
    (666666666, 666666666, 'CA_resident', 'enrolled', 'student6', 'student6', 'student6'),
    (777777777, 777777777, 'CA_resident', 'enrolled', 'student7', 'student7', 'student7'),
    (888888888, 888888888, 'CA_resident', 'enrolled', 'student8', 'student8', 'student8'),
    (999999999, 999999999, 'CA_resident', 'enrolled', 'student9', 'student9', 'student9'),
    (101010101, 101010101, 'CA_resident', 'enrolled', 'student10', 'student10', 'student10'),
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student11', 'student11', 'student11'),
    (121212121, 121212121, 'CA_resident', 'enrolled', 'student12', 'student12', 'student12'),
    (131313131, 131313131, 'CA_resident', 'enrolled', 'student13', 'student13', 'student13'),
    (141414141, 141414141, 'CA_resident', 'enrolled', 'student14', 'student14', 'student14'),
    (151515151, 151515151, 'CA_resident', 'enrolled', 'student15', 'student15', 'student15')
    ON CONFLICT DO NOTHING;

INSERT INTO undergraduateStudent VALUES     
    -- #5
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student1', 'student1', 'student1', 'Computer Science', 'Economics', 'college1'), 
    -- #6
    (222222222, 222222222, 'CA_resident', 'enrolled', 'student2', 'student2', 'student2', 'Computer Science', 'Math', 'college2'), 
    -- #7
    (333333333, 333333333, 'CA_resident', 'enrolled', 'student3', 'student3', 'student3', 'Math', 'Aquatics', 'college3'),
    -- #41
    (666666666, 666666666, 'CA_resident', 'enrolled', 'student6', 'student6', 'student6', 'Computer Science', 'Economics', 'college1'),
    (777777777, 777777777, 'CA_resident', 'enrolled', 'student7', 'student7', 'student7', 'Computer Science', 'Math', 'college2'),
    (888888888, 888888888, 'CA_resident', 'enrolled', 'student8', 'student8', 'student8', 'Computer Science', 'Economics', 'college1'),
    (999999999, 999999999, 'CA_resident', 'enrolled', 'student9', 'student9', 'student9', 'Math', 'Aquatics', 'college3'),
    (101010101, 101010101, 'CA_resident', 'enrolled', 'student10', 'student10', 'student10', 'Computer Science', 'Economics', 'college1') 
    ON CONFLICT DO NOTHING;

INSERT INTO graduateStudent VALUES 
    -- #29
    (444444444, 444444444, 'CA_resident', 'enrolled', 'student4', 'student4', 'student4', 'computer science department'),
    -- #30
    (555555555, 555555555, 'CA_resident', 'enrolled', 'student5', 'student5', 'student5', 'math department'),
    -- #41
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student11', 'student11', 'student11', 'computer science department'),
    (121212121, 121212121, 'CA_resident', 'enrolled', 'student12', 'student12', 'student12', 'math department'),
    (131313131, 131313131, 'CA_resident', 'enrolled', 'student13', 'student13', 'student13', 'computer science department'),
    (141414141, 141414141, 'CA_resident', 'enrolled', 'student14', 'student14', 'student14', 'math department'),
    (151515151, 151515151, 'CA_resident', 'enrolled', 'student15', 'student15', 'student15', 'computer science department')
    ON CONFLICT DO NOTHING;

INSERT INTO MSStudent VALUES 
    -- #29
    (444444444, 444444444, 'CA_resident', 'enrolled', 'student4', 'student4', 'student4', 'computer science department'),
    -- #30
    (555555555, 555555555, 'CA_resident', 'enrolled', 'student5', 'student5', 'student5', 'math department'),
    -- #41
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student11', 'student11', 'student11', 'computer science department'),
    (121212121, 121212121, 'CA_resident', 'enrolled', 'student12', 'student12', 'student12', 'math department'),
    ON CONFLICT DO NOTHING;

INSERT INTO BSMSStudent VALUES 
    -- #41
    (131313131, 131313131, 'CA_resident', 'enrolled', 'student13', 'student13', 'student13', 'computer science department')
    ON CONFLICT DO NOTHING;  

INSERT INTO PHDPreCandidacyStudent VALUES 
    -- #41
    (141414141, 141414141, 'CA_resident', 'enrolled', 'student14', 'student14', 'student14', 'math department')
    ON CONFLICT DO NOTHING; 

INSERT INTO faculty VALUES
    -- #35
    ('Faculty1', 'Distinguished Professor', 'computer science department'),
    -- #36
    ('Faculty2', 'Assistant Professor', 'computer science department'),
    -- #37
    ('Faculty3', 'Lecturer', 'computer science department')
    ON CONFLICT DO NOTHING;

INSERT INTO PHDCandidateStudent VALUES 
    -- #41
    (151515151, 151515151, 'CA_resident', 'enrolled', 'student15', 'student15', 'student15', 'computer science department')
    ON CONFLICT DO NOTHING; 

INSERT INTO degreeRecord VALUES
    -- #29
    (444444444, 'CS266', 'UCSD', 'INPROGRESS'),
    -- #30
    (555555555, 'MA111', 'UCSD', 'INPROGRESS')
    ON CONFLICT DO NOTHING;

-- currenet quarter means 2018 Spring
INSERT INTO courses VALUES
    -- #8, 9
    ('CSE132A', 'Letter Grade Only', 4, 'CSE', 1, 1, 'Introduction to Database'), 
    -- #10, 11
    ('CSE150A', 'Letter Grade Only', 4, 'CSE', 1, 1, 'Introduction to Artificial Intelligence'), 
    -- #12, 13
    ('CSE124A', 'Letter Grade Only', 4, 'CSE', 1, 1, 'Networked Services'), 
    -- #14, 15
    ('CSE132B', 'Letter Grade, S/U', 4, 'CSE', 1, 1, 'Database System application'), 
    -- #16,
    ('CSE132C', 'Letter Grade, S/U', 4, 'CSE', 1, 1, 'Database System Implementation'), 
    -- #17
    ('CSE130', 'Letter Grade', 4, 'CSE', 1, 1, 'Programming Languages: Principles and Paradigms'),
    ON CONFLICT DO NOTHING;

INSERT INTO classes VALUES
    -- #8, 9
    ('CSE132A', 2018, 'Spring', 'A00'),
    -- #10, 11
    ('CSE150A', 2018, 'Spring', 'A00'),
    -- #12, 13
    ('CSE124A', 2018, 'Spring', 'A00'),
    -- #14
    ('CSE132B', 2018, 'Spring', 'A00'),
    -- #16
    ('CSE132C', 2018, 'Spring', 'A00'),
    -- #17
    ('CSE130', 2018, 'Spring', 'A00'),
    ON CONFLICT DO NOTHING;

INSERT INTO location_ VALUES
    -- #8, 9, 10, 11, 12, 13
    ('RCLAS', 'RCLAS', 100),
    ON CONFLICT DO NOTHING;

INSERT INTO meetings VALUES
    -- #8, 9
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-28', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-30', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-4', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-6', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-11', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-13', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-18', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-20', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-25', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-27', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-2', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-4', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-9', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-11', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-16', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-18', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-25', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-30', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-1', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    -- #10, 11
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-23', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-28', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-30', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-4', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-6', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-11', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-13', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-18', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-20', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-25', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-27', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-2', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-4', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-9', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-11', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-16', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-18', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-23', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-25', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-30', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-1', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    -- #12, 13
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-3-28', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-4', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-11', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-18', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-25', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-2', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-9', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    
    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-16', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-23', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-30', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    -- #18
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Staff'),
    ON CONFLICT DO NOTHING;


INSERT INTO enrollment VALUES
    --#25
    (111111111, 'CSE132A', 2018, 'spring', 'A00', 'Faculty1', 4, 'INPROGRESS', 'INPROGRESS'),
    (222222222, 'CSE132A', 2018, 'spring', 'A00', 'Faculty1', 2, 'INPROGRESS', 'INPROGRESS'),
    (333333333, 'CSE132A', 2018, 'spring', 'A00', 'Faculty1', 2, 'INPROGRESS', 'INPROGRESS'),
    --#26
    (111111111, 'CSE130', 2018, 'spring', 'A00', 'Faculty1', 4, 'INPROGRESS', 'INPROGRESS'),
    ON CONFLICT DO NOTHING;

INSERT INTO past_enrollment VALUES
    --#27
    (111111111, 'CSE132B', 2015, 'fall', 'A00', 'Faculty1', 4, 'A'),
    (222222222, 'CSE132B', 2015, 'fall', 'A00', 'Faculty1', 2, 'B'),
    (333333333, 'CSE132B', 2015, 'fall', 'A00', 'Faculty1', 2, 'C'),
    --#28
    (111111111, 'CSE132C', 2015, 'fall', 'A00', 'Faculty1', 3, 'B'),
    (222222222, 'CSE132C', 2015, 'fall', 'A00', 'Faculty1', 4, 'C'),
    (333333333, 'CSE132C', 2015, 'fall', 'A00', 'Faculty1', 4, 'A'),
    --#42
    (666666666, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'A'),
    (777777777, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'A'),
    (888888888, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'B'),
    (999999999, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'B'),
    (101010101, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'C'),
    (111111111, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'C'),
    (121212121, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'C'),
    (131313131, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'D'),
    (141414141, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'D'),
    (151515151, 'CSE008', 2017, 'fall', 'A00', 'Faculty3', 4, 'D'),
    --#43
    (666666666, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'A'),
    (777777777, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'A'),
    (888888888, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'A'),
    (999999999, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'A'),
    (101010101, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'A'),
    (111111111, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'B'),
    (121212121, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'B'),
    (131313131, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'B'),
    (141414141, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'B'),
    (151515151, 'CSE005', 2017, 'fall', 'A00', 'Faculty3', 4, 'C'),
    --#44
    (666666666, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'A'),
    (777777777, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'A'),
    (888888888, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'A'),
    (999999999, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'A'),
    (101010101, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'A'),
    (111111111, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'B'),
    (121212121, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'B'),
    (131313131, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'B'),
    (141414141, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'B'),
    (151515151, 'CSE150A', 2017, 'fall', 'A00', 'Faculty2', 4, 'C')
    ON CONFLICT DO NOTHING;