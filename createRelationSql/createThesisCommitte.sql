CREATE TABLE thesisCommitte(
    student_id int, 
    faculty_name char(20), 
    PRIMARY KEY(student_id, faculty_name), 
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES graduateStudent(student_id)
        ON DELETE CASCADE, 
    CONSTRAINT FK_faculty_name
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE CASCADE
); 
