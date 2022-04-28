CREATE TABLE degree_(
    degree_id int, 
    institution char(50), 
    degree_name char(50), 
    department char(20), 

    PRIMARY KEY(degree_id, institution)
); 


CREATE TABLE undergraduateDegree(
    degree_id int, 
    institution char(50), 
    type char(20), 
    upper_division_units int, 
    lower_division_units int, 
    department char(20),

    PRIMARY KEY(degree_id),
    CONSTRAINT FK_degree_id 
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution) 
        ON DELETE SET NULL
)

CREATE TABLE graduateDegree(
    degree_id int, 
    institution char(50), 
    type char(20), 
    department char(20), 

    PRIMARY KEY(degree_id), 
    CONSTRAINT FK_degree_id 
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution) 
        ON DELETE SET NULL 
); 
