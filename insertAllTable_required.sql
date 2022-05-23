-- 4. Any course inserted with 1xx is upper div, and any course inserted with 0xx is lower div, any course could be an elective

INSERT INTO degree_ VALUES
    -- #1
    ('CS26', 'UCSD', 'Computer Science', 'CSE'), 
    -- #2
    ('MA1', 'UCSD', 'Mathematics', 'MATH'), 
    -- #3
    ('CS266', 'UCSD', 'Computer Science', 'CSE'), 
    ('MA111', 'UCSD', 'Mathematics', 'MATH'),

    ON CONFLICT DO NOTHING;


INSERT INTO undergraduateDegree VALUES
    -- #1
    ('CS26', 'UCSD', 'Computer Science', 'CSE', 'BS', 12, 12, 20, 8, 20, 20),
    -- #2
    ('MA1', 'UCSD', 'Mathematics', 'MATH', 'BS', 8, 16, 20, 12, 20, 20),
    ON CONFLICT DO NOTHING; 

-- #3
INSERT INTO graduateDegree VALUES
    ('CS266', 'UCSD', 'Computer Science', 'CSE', 20), 
    ('MA111', 'UCSD', 'Mathematics', 'MATH', 20),

-- #3  
INSERT INTO gradudateDegreeRequiarment VALUES
    ('CS266', 'UCSD', 'CSE132A', 'YES', 'Database Concentration'),
    ('CS266', 'UCSD', '', 'YES', 'System Concentration'),
    ('MA111', 'UCSD', '', 'YES', 'Number Theory'),
    ('MA111', 'UCSD', '', 'YES', 'Calculus'),
    ON CONFLICT DO NOTHING;


INSERT INTO student VALUES 
    -- #5
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student1', 'student1', 'student1'),
    -- #6
    (222222222, 222222222, 'CA_resident', 'enrolled', 'student2', 'student2', 'student2'),
    -- #7
    (333333333, 333333333, 'CA_resident', 'enrolled', 'student3', 'student3', 'student3'),
    ON CONFLICT DO NOTHING;

INSERT INTO undergraduateStudent VALUES     
    -- #5
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student1', 'student1', 'student1','Computer Science', 'Economics', 'college1'), 
    -- #6
    (222222222, 222222222, 'CA_resident', 'enrolled', 'student2', 'student2', 'student2','Computer Science', 'Math', 'college2'), 
    -- #7
    (333333333, 333333333, 'CA_resident', 'enrolled', 'student3', 'student3', 'student3','Math', 'Aquatics', 'college3'), 
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

INSERT INTO faculty VALUES
    -- #10
    ('Staff', 'Title', 'Department'), 
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