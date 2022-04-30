CREATE TABLE location(
    room_number char(20), 
    building_number char(20),  
    capacity int, 

    PRIMARY KEY(room_number, building_number)
); 