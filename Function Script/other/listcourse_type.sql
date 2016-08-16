
CREATE OR REPLACE view v_list_course_type
AS
SELECT course_id,course_type,gn.generation
FROM tbl_course crs INNER JOIN tbl_generation gn ON crs.g_id=gn.g_id
WHERE crs.status=1;
CREATE or REPLACE FUNCTION list_course_type()
RETURNS SETOF v_list_course_type AS
$$
SELECT * FROM v_list_course_type
$$ LANGUAGE 'sql' STABLE;