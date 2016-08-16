CREATE VIEW v_active_generation
AS SELECT g_id,generation FROM tbl_generation WHERE status=1;

CREATE OR REPLACE FUNCTION get_active_generation()
RETURNS SETOF v_active_generation AS
$$
 SELECT * FROM v_active_generation
$$ LANGUAGE 'sql' STABLE;