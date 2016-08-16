CREATE OR REPLACE FUNCTION update_generation(int,VARCHAR,DATE,DATE,TEXT)
RETURNS VOID AS
$$
BEGIN
 UPDATE tbl_generation
 SET generation=$2,
     orientation_date=$3,
     finish_date=$4,
     discription=$5
 WHERE g_id=$1; 
END;
$$ LANGUAGE 'plpgsql' VOLATILE;