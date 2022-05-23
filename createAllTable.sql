create table student(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(50), 
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    PRIMARY KEY (student_id)
); 

create table undergraduateStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(50), 
    first_name char(50), 
    last_name char(50), 
    middle_name char(50),  
    
    major char(50), 
    minor char(50), 
    college char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


create table BSMSStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(50),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 

    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

create table MSStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(50),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



create table PHDPreCandidacyStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(50),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE probation(
    student_id int, 
    year int, 
    quarter char(10), 
    university char(50), 
    reason char(255) not null , 

    PRIMARY KEY(student_id, year, quarter, university),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); 

CREATE TABLE faculty(
    faculty_name char(50), 
    title char(50), 
    department char(50), 

    PRIMARY KEY(faculty_name)
); 


create table PHDCandidateStudent(
    student_id int, 
	SSN int,  
    identity_ char(50), 
    enrollment_status char(50),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    faculty_name char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 
        

    CONSTRAINT FK_faculty_name
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

create table graduateStudent(
    student_id int,
	SSN int,  
    identity_ char(50), 
    enrollment_status char(50),
    first_name char(50), 
    last_name char(50), 
    middle_name char(50), 
    department char(50), 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE location_(
    room_number char(50), 
    building_number char(50), 
    capacity int,

    PRIMARY KEY(room_number, building_number)
); 

CREATE TABLE degree_(
    degree_id char(50), 
    institution char(50), 
    degree_name char(50), 
    department char(50), 

    PRIMARY KEY(degree_id, institution)
); 


CREATE TABLE undergraduateDegree(
    degree_id char(50), 
    institution char(50), 
    degree_name char(50),
    department char(50),

    type char(50), /* type is BA or BS*/ 
    upper_division_units int, 
    lower_division_units int, 

    core_units int, 
    technical_units int, 
    major_elective_units int, 
    college_units int,

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
    department char(50), 
    required_units int, 

    PRIMARY KEY(degree_id, institution), 
    CONSTRAINT FK_degree_id 
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution) 
        ON DELETE CASCADE
        ON UPDATE CASCADE 
);

CREATE TABLE courses(
    course_number char(50), 
    grading_option char(50), 
    unit int, 
    department char(50), 
    lab_required int, 
    is_upper int, /* 1-> upper classes, 0-> lower classes 2->graduate*/
    course_title char(100), 

    PRIMARY KEY(course_number) 
); 

CREATE TABLE coursePrequisite(
    course_number char(50), 
    prerequisite char(50), 

    PRIMARY KEY(course_number, prerequisite),
    CONSTRAINT FK_course 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_prerequisite
        FOREIGN KEY(prerequisite) REFERENCES courses(course_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE classes(
    course_number char(50), 
    year_ int, 
    quarter char(10), 
    section_id char(50), 

    PRIMARY KEY(course_number, year_, quarter, section_id), 
    CONSTRAINT FK_course_number 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); 

CREATE TABLE meetings(
    course_number char(50), 
    year_ int, 
    quarter char(10), 
    section_id char(50), 
    type_ char(50), 
    date_ date NOT NULL DEFAULT CURRENT_DATE, 

    begin_time time NOT NULL DEFAULT CURRENT_TIME,
    end_time time NOT NULL DEFAULT CURRENT_TIME, 
    mandatory char(10), 
    room_number char(50), 
    building_number char(50),
    faculty_name char(50), 

    PRIMARY KEY(course_number, year_, quarter, section_id, type_, date_),
    CONSTRAINT FK_classes 
        FOREIGN KEY(course_number, year_, quarter, section_id) REFERENCES classes(course_number, year_, quarter, section_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 
    CONSTRAINT FK_location
        FOREIGN KEY(room_number, building_number) REFERENCES location_(room_number, building_number)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT FK_faculty 
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE CASCADE
); 

/**
    Relations
*/
CREATE TABLE course_offering_ny(
    faculty_name char(50), 
    course_number char(50), 
    year_ int, 
    quarter char(10), 
    section_id char(50),
    course_title char(100),

    PRIMARY KEY(faculty_name, course_number, year_, quarter, section_id),
    
    CONSTRAINT FK_faculty_name
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

   CONSTRAINT FK_course_number 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); 

CREATE TABLE degreeRecord(
    student_id int,
    degree_id char(50), 
    institution char(50),
    status char(50), 

    PRIMARY KEY(student_id, degree_id, institution), 
    CONSTRAINT FK_degree
        FOREIGN KEY(degree_id, institution) REFERENCES degree_(degree_id, institution)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE gradudateDegreeRequiarment(
    degree_id char(50), 
    institution char(50),
    course_number char(50), 
    is_required char(10), 
    concentration char(50) NOT NULL, /*assumption: one course for one degree belongs in one concentration*/
    concentration_units int, 
    minimum_gpa int, 

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
    course_number char(50), 
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

CREATE TABLE enrollment(
    student_id int, 
    course_number char(50), 
    year_ int, 
    quarter char(10), 
    section_id char(50), 
    faculty_name char(50), 
    unit_taken int,
    status char(50), 
    grade char(50), 

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
    course_number char(50), 
    year_ int, 
    quarter char(10), 
    section_id char(50),
    faculty_name char(50),
    unit_taken int,
    grade char(50), 

    PRIMARY KEY(student_id, course_number, year_, quarter, section_id, faculty_name), 
    CONSTRAINT FK_classes 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE CASCADE,
    CONSTRAINT FK_student 
        FOREIGN KEY(student_id) REFERENCES student(student_id)
        ON DELETE CASCADE
); 

CREATE TABLE thesisCommittee(
    student_id int, 
    faculty_name char(50), 
    PRIMARY KEY(student_id, faculty_name), 
    CONSTRAINT FK_student_id 
        FOREIGN KEY(student_id) REFERENCES graduateStudent(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 
    CONSTRAINT FK_faculty_name
        FOREIGN KEY(faculty_name) REFERENCES faculty(faculty_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE
); 

create table GRADE_CONVERSION(

    GRADE CHAR(20) NOT NULL,
    NUMBER_GRADE DECIMAL(2,1)
);
