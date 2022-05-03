/**
    record past student degrees
*/ 
CREATE TABLE degreeRecord(
    student_id int,
    degree_id char(50), 
    institution char(50),
    status char(20), 

    PRIMARY KEY(student_id, degree_id, institution), 
    CONSTRAINT FK_degree
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution)
        ON DELETE CASCADE,
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
); 