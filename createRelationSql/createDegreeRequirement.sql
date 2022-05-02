CREATE TABLE gradudateDegreeRequiarment(
    degree_id char(50), 
    institution char(50),
    course_number char(20), 
    is_required char(10), 
    concentration char(20) NOT NULL, 

    PRIMARY KEY(degree_id, institution, course_number), 
    CONSTRAINT FK_degree
        FOREIGN KEY(degree_id, institution) REFERENCES graduateDegree(degree_id, institution)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 
    CONSTRAINT FK_course 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); 

CREATE TABLE underGradudateDegreeRequiarment(
    degree_id char(50), 
    institution char(50),
    course_number char(20), 
    is_core char(10), 
    is_technical_elective char(10), 
    is_major_elective char(10), 
    is_college_required char(10), 
    minimum_grade int, 

    PRIMARY KEY(degree_id, institution, course_number), 
    CONSTRAINT FK_degree
        FOREIGN KEY(degree_id, institution) REFERENCES undergraduateDegree(degree_id, institution)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_course 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); 