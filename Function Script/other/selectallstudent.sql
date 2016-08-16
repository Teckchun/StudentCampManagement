CREATE OR REPLACE VIEW select_allstudents AS
 SELECT stu.stu_id,
    stu.last_name,
    stu.first_name
FROM tbl_students stu INNER JOIN tbl_selection see
ON see.stu_id=stu.stu_id INNER JOIN tbl_class cls
ON cls.class_id=see.class_id WHERE stu.status=1 AND cls.status=1;

CREATE OR REPLACE FUNCTION select_allstudentsf() 
RETURNS SETOF select_allstudents AS
$$
	SELECT * FROM select_allstudents;
$$
LANGUAGE 'sql' STABLE;