INSERT INTO enrollment VALUES
    --#25
    (111111111, 'CSE132A', 2018, 'spring', 'A00', 'faculty_1', 4, 'INPROGRESS', 'A'),
    (222222222, 'CSE132A', 2018, 'spring', 'A00', 'faculty_1', 2, 'INPROGRESS', 'A'),
    (333333333, 'CSE132A', 2018, 'spring', 'A00', 'faculty_1', 2, 'INPROGRESS', 'A'),
    --#26
    (111111111, 'CSE130', 2018, 'spring', 'A00', 'faculty_1', 4, 'INPROGRESS', 'A'),
    ON CONFLICT DO NOTHING;

INSERT INTO past_enrollment VALUES
    --#27
    (111111111, 'CSE132B', 2015, 'fall', 'A00', 'faculty_1', 4, 'A'),
    (222222222, 'CSE132B', 2015, 'fall', 'A00', 'faculty_1', 2, 'B'),
    (333333333, 'CSE132B', 2015, 'fall', 'A00', 'faculty_1', 2, 'C'),
    --#28
    (111111111, 'CSE132C', 2015, 'fall', 'A00', 'faculty_1', 3, 'B'),
    (222222222, 'CSE132C', 2015, 'fall', 'A00', 'faculty_1', 4, 'C'),
    (333333333, 'CSE132C', 2015, 'fall', 'A00', 'faculty_1', 4, 'A'),
    ON CONFLICT DO NOTHING;