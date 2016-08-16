CREATE VIEW v_1generaton_info
AS 
SELECT g_id,generation,orientation_date,finish_date,discription
FROM tbl_generation;
CREATE OR REPLACE FUNCTION get_1generation_info(INT)
RETURNS v_1generaton_info as 
$$
  SELECT * FROM v_1generaton_info WHERE g_id=$1
$$ LANGUAGE 'sql' STABLE;