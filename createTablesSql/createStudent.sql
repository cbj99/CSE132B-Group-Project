create table student(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20), 
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    PRIMARY KEY (student_id)
); 

create table undergraduateStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20), 
    first_name char(50), 
    last_name char(50), 
    middle_name char(50),  
    major char(50), 
    minor char(50), 
    college char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
);

create table graduateStudent(
    student_id int,
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
);

create table BSMSStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
);

create table MSStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
);

create table PHDStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
);

create table PHDPreCandidacyStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
);

CREATE TABLE probation(
    student_id int, 
    year int, 
    quarter char(10), 
    university char(20), 
    reason char(255) not null , 

    PRIMARY KEY(student_id, year, quarter, university),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL
); 

CREATE TABLE faculty(
    faculty_name char(20), 
    title char(20), 
    department char(20), 

    PRIMARY KEY(faculty_name)
); 

/*
    TODO: foreign key constraint on faculty name waiting for faculty table to be constructed
*/ 
create table PHDCandidateStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(20),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    faculty_name char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE SET NULL,

    CONSTRAINT FK_faculty_name
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE SET NULL
);
