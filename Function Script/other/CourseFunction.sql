
---->Add Course
-------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION add_course(VARCHAR,DATE,DATE,INT,TEXT)
RETURNS Void AS 
$$
BEGIN
INSERT INTO tbl_course(course_type,start_date,end_date,g_id,description)
VALUES($1,$2,$3,$4,$5);
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
-------------------------------------------------------------------------------------------------------------------
----Update Course Status
-----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION change_course_status(INT,INT)
RETURNS VOID AS
$$
BEGIN
  IF $2=1 THEN
     UPDATE tbl_course SET status=0 WHERE course_id=$1;
     UPDATE tbl_class SET status=0 WHERE course_id=$1;
  ELSE
      UPDATE tbl_course SET status=1 WHERE course_id=$1;
      UPDATE tbl_class SET status=1 WHERE course_id=$1;  
   END IF;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;

SELECT change_course_status(4,1);
------------------------------------------------------------------------------------------------------------------------
---->Get All Course
--------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_all_cousre()
RETURNS SETOF v_course AS
$$
 SELECT * FROM v_course
$$ LANGUAGE 'sql' STABLE;
--------------------------------------------------------------------------------------------------------------------
--Function Get Course In Generation
----------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_course_in_generation(INT)
RETURNS SETOF v_course_in_generation AS
$$
 SELECT * FROM v_course_in_generation WHERE g_id=$1
$$ LANGUAGE 'sql' STABLE;

SELECT * FROM get_course_in_generation(5);
--------------------------------------------------------------------------------------------------------------------
----List Course
--------------------------------------------------------------------------
CREATE or REPLACE FUNCTION list_course_type()
RETURNS SETOF v_list_course_type AS
$$
SELECT * FROM v_list_course_type
$$ LANGUAGE 'sql' STABLE;
---------------------------------------------------------------------------------------------------------------------
---Update Course
--------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION update_course(int,VARCHAR,Date,DATE,int,TEXT)
RETURNS VOID AS
$$
BEGIN
UPDATE tbl_course 
SET course_type=$2,start_date=$3,end_date=$4,g_id=$5,description=$6
WHERE course_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
-----------------------------------------------------------------------------------------------------------------------
