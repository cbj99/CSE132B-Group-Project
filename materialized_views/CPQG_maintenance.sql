CREATE or replace TRIGGER CPQG_maintenance 
    AFTER INSERT on past_enrollment
    FOR EACH ROW
BEGIN

