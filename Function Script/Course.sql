CREATE OR REPLACE FUNCTION add_course(VARCHAR,DATE,DATE,INT,TEXT)
RETURNS Void AS 
$$
BEGIN
INSERT INTO tbl_course(course_type,start_date,end_date,g_id,description)
VALUES($1,$2,$3,$4,$5);
END;
$$ LANGUAGE 'plpgsql' VOLATILE;




CREATE VIEW v_1course_info
AS 
SELECT cou.course_id,cou.course_type,gen.g_id,gen.generation,cou.start_date,cou.end_date,cou.description
FROM tbl_course cou INNER JOIN tbl_generation gen
ON gen.g_id=cou.g_id;

CREATE OR REPLACE FUNCTION get_1course_info(INT)
RETURNS v_1course_info as 
$$
  SELECT * FROM v_1course_info WHERE course_id=$1
$$ LANGUAGE 'sql' STABLE;


CREATE VIEW v_course AS
SELECT course.course_id,course.course_type,gen.generation,course.start_date,course.end_date,course.status,gen.status genstatus
FROM tbl_course course INNER JOIN tbl_generation gen
ON course.g_id=gen.g_id;





CREATE OR REPLACE FUNCTION get_all_cousre()
RETURNS SETOF v_course AS
$$
 SELECT * FROM v_course
$$ LANGUAGE 'sql' STABLE;



CREATE or REPLACE FUNCTION update_course(int,VARCHAR,Date,DATE,int,TEXT)
RETURNS VOID AS
$$
BEGIN
UPDATE tbl_course 
SET course_type=$2,start_date=$3,end_date=$4,g_id=$5,description=$6
WHERE course_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
