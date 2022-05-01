INSERT INTO location VALUES(1, 2, 300);
INSERT INTO location VALUES(1, 3, 600);
INSERT INTO location VALUES(2, 4, 1000);

DELETE FROM location where room_number='1' and building_number='3'; 

UPDATE location SET capacity=700 where room_number='2' and building_number='4';