CREATE TABLE course_offering_ny(
    faculty_name char(50), 
    course_number char(20), 
    year_ int, 
    quarter char(10), 
    section_id int,

    PRIMARY KEY(faculty_name, course_number, year_, quarter, section_id),
    
    CONSTRAINT FK_faculty_name
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT FK_courses 
        FOREIGN KEY(course_number) REFERENCES classes(course_number, year_, quarter, section_id)
        ON DELETE CASCADE
); 