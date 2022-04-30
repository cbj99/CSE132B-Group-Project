CREATE TABLE courses(
    course_number char(20), 
    grading_option char(20), 
    unit int, 
    department char(20), 
    lab_required int, 

    PRIMARY KEY(course_number) 
); 

CREATE TABLE coursePrequisite(
    course_number char(20), 
    prerequisite char(20), 

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
    course_number char(20), 
    year_ int, 
    quarter char(10), 
    section_id int, 

    PRIMARY KEY(course_number, year_, quarter, section_id), 
    CONSTRAINT FK_course_number 
        FOREIGN KEY(course_number) REFERENCES courses(course_number)
        ON DELETE SET NULL
); 

CREATE TABLE meetings(
    course_number char(20), 
    year_ int, 
    quarter char(10), 
    section_id int, 
    type_ char(20), 
    date char(20), 
    time char(20), 
    mandatory int, 
    room_number char(20), 
    building_number char(20),

    PRIMARY KEY(course_number, year_, quarter, section_id, type_, date),
    CONSTRAINT FK_classes 
        FOREIGN KEY(course_number, year_, quarter, section_id) REFERENCES classes(course_number, year_, quarter, section_id)
        ON DELETE SET NULL, 
    CONSTRAINT FK_location
        FOREIGN KEY(room_number, building_number) REFERENCES location(room_number, building_number)
        ON DELETE SET NULL
); 