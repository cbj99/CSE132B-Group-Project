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
    -- #31
    ('CS266', 'UCSD', 'CSE132A', 'YES', 'Database Concentration', 6, 3),
    ('CS266', 'UCSD', 'CSE132B', 'YES', 'Database Concentration', 6, 3),
    ('CS266', 'UCSD', 'CSE132C', 'YES', 'Database Concentration', 6, 3),

    -- #32
    ('CS266', 'UCSD', 'CSE130', 'YES', 'System Concentration', 12, 3),
    ('CS266', 'UCSD', 'CSE000', 'YES', 'System Concentration', 12, 3),
    ('CS266', 'UCSD', 'CSE007', 'YES', 'System Concentration', 12, 3),
    ('CS266', 'UCSD', 'CSE132B', 'YES', 'System Concentration', 12, 3),

    -- #33
    ('MA111', 'UCSD', 'MATH132A', 'YES', 'Number Theory Concentration', 6, 3),
    ('MA111', 'UCSD', 'MATH132B', 'YES', 'Number Theory Concentration', 6, 3),
    ('MA111', 'UCSD', 'MATH132C', 'YES', 'Number Theory Concentration', 6, 3),

    -- #34
    ('MA111', 'UCSD', 'MATH130', 'YES', 'Calculus Concentration', 12, 3),
    ('MA111', 'UCSD', 'MATH000', 'YES', 'Calculus Concentration', 12, 3),
    ('MA111', 'UCSD', 'MATH007', 'YES', 'Calculus Concentration', 12, 3),
    ('MA111', 'UCSD', 'MATH132B', 'YES', 'Calculus Concentration', 12, 3),
    ON CONFLICT DO NOTHING;


INSERT INTO student VALUES 
    -- #5
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student1', 'student1', 'student1'),
    -- #6
    (222222222, 222222222, 'CA_resident', 'enrolled', 'student2', 'student2', 'student2'),
    -- #7
    (333333333, 333333333, 'CA_resident', 'enrolled', 'student3', 'student3', 'student3')
    ON CONFLICT DO NOTHING;

INSERT INTO undergraduateStudent VALUES     
    -- #5
    (111111111, 111111111, 'CA_resident', 'enrolled', 'student1', 'student1', 'student1','Computer Science', 'Economics', 'college1'), 
    -- #6
    (222222222, 222222222, 'CA_resident', 'enrolled', 'student2', 'student2', 'student2','Computer Science', 'Math', 'college2'), 
    -- #7
    (333333333, 333333333, 'CA_resident', 'enrolled', 'student3', 'student3', 'student3','Math', 'Aquatics', 'college3')
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
    -- #19s
    ('CSE005', 'Letter Grade', 4, 'CSE', 1, 0, 'CSE005 Course Title'),
    -- #20
    ('CSE000', 'Letter Grade', 4, 'CSE', 1, 0, 'CSE000 Course Title'),
    -- #21
    ('CSE007', 'Letter Grade', 4, 'CSE', 1, 0, 'CSE007 Course Title'),
     -- #22
    ('CSE008', 'Letter Grade', 4, 'CSE', 1, 0, 'CSE008 Course Title'),

    -- #23
    ('MATH132A', 'Letter Grade Only', 4, 'CSE', 1, 1, 'MATH132A Course Title'), 
    ('MATH150A', 'Letter Grade Only', 4, 'CSE', 1, 1, 'MATH150A Course Title'), 
    ('MATH124A', 'Letter Grade Only', 4, 'CSE', 1, 1, 'MATH124A Course Title'), 
    ('MATH132B', 'Letter Grade, S/U', 4, 'CSE', 1, 1, 'MATH132B Course Title'), 
    ('MATH132C', 'Letter Grade, S/U', 4, 'CSE', 1, 1, 'MATH132C Course Title'), 
    ('MATH130', 'Letter Grade', 4, 'CSE', 1, 1, 'MATH130 Course Title'),
    ('MATH005', 'Letter Grade', 4, 'CSE', 1, 0, 'MATH005 Course Title'),
    ('MATH000', 'Letter Grade', 4, 'CSE', 1, 0, 'MATH000 Course Title'),
    ('MATH007', 'Letter Grade', 4, 'CSE', 1, 0, 'MATH007 Course Title'),
    ('MATH008', 'Letter Grade', 4, 'CSE', 1, 0, 'MATH008 Course Title')
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
    -- #19
    ('CSE005', 2018, 'Spring', 'A00'),
    ('CSE005', 2017, 'Fall', 'A00'),
    -- #20
    ('CSE000', 2018, 'Spring', 'A00'),
    ('CSE000', 2017, 'Fall', 'A00'),
    -- #20
    ('CSE007', 2018, 'Spring', 'A00'),
    ('CSE007', 2017, 'Fall', 'A00'),
     -- #21
    ('CSE008', 2018, 'Spring', 'A00'),
    ('CSE008', 2017, 'Fall', 'A00'),

    -- #23
    ('MATH132A', 2018, 'Spring', 'A00'),
    ('MATH150A', 2018, 'Spring', 'A00'),
    ('MATH124A', 2018, 'Spring', 'A00'),
    ('MATH132B', 2018, 'Spring', 'A00'),
    ('MATH132C', 2018, 'Spring', 'A00'),
    ('MATH130', 2018, 'Spring', 'A00'),
    ('MATH005', 2018, 'Spring', 'A00'),
    ('MATH005', 2017, 'Fall', 'A00'),
    ('MATH000', 2018, 'Spring', 'A00'),
    ('MATH000', 2017, 'Fall', 'A00'),
    ('MATH007', 2018, 'Spring', 'A00'),
    ('MATH007', 2017, 'Fall', 'A00'),
    ('MATH008', 2018, 'Spring', 'A00'),
    ('MATH008', 2017, 'Fall', 'A00'),

    -- #24
    ('MATH005', 2017, 'Fall', 'A00'),
    ('MATH005', 2015, 'Fall', 'A00'),
    ('MATH000', 2017, 'Fall', 'A00'),
    ('MATH000', 2015, 'Fall', 'A00'),
    ('MATH007', 2017, 'Fall', 'A00'),
    ('MATH007', 2015, 'Fall', 'A00'),
    ('MATH008', 2017, 'Fall', 'A00'),
    ('MATH008', 2015, 'Fall', 'A00')
    ON CONFLICT DO NOTHING;

INSERT INTO location_ VALUES
    -- #8, 9, 10, 11, 12, 13
    ('RCLAS', 'RCLAS', 100)
    ON CONFLICT DO NOTHING;

INSERT INTO faculty VALUES
    -- #10
    ('Staff', 'Title', 'Department'),
    ('Faculty1', 'Title', 'Department'),
    ('Faculty2', 'Title', 'Department'),
    ('Faculty3', 'Title', 'Department')
     ON CONFLICT DO NOTHING;

INSERT INTO meetings VALUES
    -- #8, 9
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-28', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-30', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-4', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-6', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-11', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-13', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-18', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-20', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-25', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-27', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-2', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-4', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-9', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-11', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-16', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-18', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-25', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-30', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-1', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132A', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    -- #10, 11
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-23', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-28', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-30', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-4', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-6', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-11', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-13', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-18', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-20', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-25', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-27', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-2', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-4', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-9', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-11', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-16', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-18', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-23', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-25', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-30', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE150A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-1', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    -- #12, 13
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-3-28', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-4', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-11', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-18', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-25', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-2', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-9', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    
    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-16', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-23', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('CSE124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-30', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('CSE124A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    -- #18 TUTHU discussion on Friday
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('CSE132C', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    -- #19
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE005', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    -- #20
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE000', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    -- #21
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE007', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    -- #22
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('CSE008', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

--------------------------------------------------------------------------------------------------------------------------------------
    -- #23
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-28', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-30', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-4', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-6', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-11', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-13', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-18', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-20', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-25', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-27', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-2', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-4', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-9', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-11', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-16', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-18', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-23', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-25', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-30', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-1', '13:00:00', '15:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132A', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '13:00:00', '13:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    -- MATH150A
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-23', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-28', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-30', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-4', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-6', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-11', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-13', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-18', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-20', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-25', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-27', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-2', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-4', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-9', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-11', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-16', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-18', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-23', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-25', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-30', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH150A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-1', '14:00:00', '16:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    -- MATH 124A
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-3-28', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-4', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-11', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-18', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-4-25', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-2', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-9', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    
    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-16', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-23', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    ('MATH124A', 2018, 'Spring', 'A00', 'Discussion', '2018-5-30', '12:00:00', '12:50:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),
    ('MATH124A', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2', '20:00:00', '21:20:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty2'),

    -- MATH132C
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),
    ('MATH132C', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty1'),

    -- MATH 005
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH005', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    -- MATH000
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH000', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    -- MATH 007
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH007', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    -- MATH 008
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-3-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-3-25', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-3-29', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-3-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-1', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-7', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-8', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-14', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-15', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-21', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-22', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-4-28', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-4-29', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-3', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-5', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-6', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-10', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-12', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-13', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-17', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-19', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-20', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-24', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-26', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-5-27', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),

    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-5-31', '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Lecture', '2018-6-2',  '10:00:00', '13:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3'),
    ('MATH008', 2018, 'Spring', 'A00', 'Discussion', '2018-6-3', '9:00:00', '10:00:00', 'YES', 'RCLAS', 'RCLAS', 'Faculty3')

    ON CONFLICT DO NOTHING;