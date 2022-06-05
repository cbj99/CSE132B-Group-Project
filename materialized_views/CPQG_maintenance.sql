CREATE or REPLACE FUNCTION trigger_function_update_CPG() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN

end; 


CREATE or replace TRIGGER CPQG_maintenance 
    AFTER INSERT on past_enrollment
    FOR EACH ROW
    EXECUTE procedure update_cpqg();
