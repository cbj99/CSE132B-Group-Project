INSERT INTO faculty VALUES
    ('faculty_2', 'Distinguished Professor', 'CSE'), 
    ('faculty_3', 'Assistant professor', 'CSE'), 
    ('faculty_4', 'Lecturer', 'Biology'), 
    ('faculty_5', 'distinguished professor', 'Physics'), 
    ('faculty_6', 'distinguished professor', 'Music'); 

UPDATE faculty SET
    faculty_name = 'faculty_22', title='Assistant Professor', department='Math'
    where faculty_name='faculty_2';
