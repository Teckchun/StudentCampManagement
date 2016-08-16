CREATE OR REPLACE FUNCTION get_all_generation()
RETURNS SETOF tbl_generation AS
$$
SELECT * FROM tbl_generation order by g_id
$$
LANGUAGE 'sql' STABLE;

SELECT * FROM get_all_generation();