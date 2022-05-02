/**
    record past student degrees
*/ 
CREATE TABLE degreeRecord(
    student_id int,
    degree_id int, 
    institution char(50),
    status char(20), 

    PRIMARY KEY(student_id, degree_id, institution), 
    CONSTRAINT FK_degree
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution)
        ON DELETE SET NULL,
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
); 