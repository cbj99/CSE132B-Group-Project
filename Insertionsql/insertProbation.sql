INSERT INTO probation VALUES(5, 2021, 'winter', 'UCSD', 'loooool');

DELETE FROM probation where student_id=11; 

UPDATE probation SET student_id=11, year=2022, quarter='Spring', university='USD', reason='Blah' where student_id=3 and year=2021 and quarter='fall' and university='UCSD';