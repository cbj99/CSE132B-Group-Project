CREATE TABLE degree_(
    degree_id char(50), 
    institution char(50), 
    degree_name char(50), 
    department char(20), 

    PRIMARY KEY(degree_id, institution)
); 


CREATE TABLE undergraduateDegree(
    degree_id char(50), 
    institution char(50), 
    degree_name char(50),
    department char(20),
    type char(20), 
    upper_division_units int, 
    lower_division_units int, 

    PRIMARY KEY(degree_id, institution),
    CONSTRAINT FK_degree_id 
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE graduateDegree(
    degree_id char(50), 
    institution char(50), 
    degree_name char(50),
    department char(20), 

    PRIMARY KEY(degree_id, institution), 
    CONSTRAINT FK_degree_id 
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution) 
        ON DELETE CASCADE
        ON UPDATE CASCADE 
); 
