CREATE TABLE enrollment(
    student_id int, 
    course_number char(20), 
    year_ int, 
    quarter char(10), 
    section_id int, 
    faculty_name char(20), 
    status char(10), 
    grade char(10), 

    PRIMARY KEY(student_id, course_number, year_, quarter, section_id, faculty_name), 
    CONSTRAINT FK_classes 
        FOREIGN KEY(course_number, year_, quarter, section_id) REFERENCES classes(course_number, year_, quarter, section_id)
        ON DELETE SET NULL,
    CONSTRAINT FK_student 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL,
    CONSTRAINT FK_faculty 
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
); 

CREATE TABLE gradudateDegreeRequiarment(
    degree_id int, 
    institution char(50),
    course_number char(20), 
    is_required int, 
    concentration char(20) NOT NULL, 

    PRIMARY KEY(degree_id, course_number), 
    CONSTRAINT FK_degree
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution)
        ON DELETE SET NULL,
    CONSTRAINT FK_course 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE SET NULL
); 

CREATE TABLE underGradudateDegreeRequiarment(
    degree_id int, 
    institution char(50),
    course_number char(20), 
    is_core int, 
    is_technical_elective int, 
    is_major_elective int, 
    is_college_required int, 
    minimun_grade int, 

    PRIMARY KEY(degree_id, course_number), 
    CONSTRAINT FK_degree
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution)
        ON DELETE SET NULL,
    CONSTRAINT FK_course 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE SET NULL
); 