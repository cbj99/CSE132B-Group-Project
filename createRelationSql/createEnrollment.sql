CREATE TABLE enrollment(
    student_id int, 
    course_number char(20), 
    year_ int, 
    quarter char(10), 
    section_id int, 
    faculty_name char(20), 

    status char(20), 
    grade char(20), 

    PRIMARY KEY(student_id, course_number, year_, quarter, section_id, faculty_name), 
    CONSTRAINT FK_classes 
        FOREIGN KEY(course_number, year_, quarter, section_id) REFERENCES classes(course_number, year_, quarter, section_id)
        ON DELETE CASCADE,
    CONSTRAINT FK_student 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE,
    CONSTRAINT FK_faculty 
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE CASCADE
); 

CREATE TABLE past_enrollment(
    student_id int, 
    course_number char(20), 
    year_ int, 
    quarter char(10), 
    
    grade char(20), 

    PRIMARY KEY(student_id, course_number, year_, quarter), 
    CONSTRAINT FK_classes 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE CASCADE,
    CONSTRAINT FK_student 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
); 

