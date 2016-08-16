CREATE or REPLACE FUNCTION add_class(VARCHAR,VARCHAR,INT,TEXT)
RETURNS VOID AS
$$
BEGIN
INSERT INTO tbl_class(class_name,class_color,course_id,description)
VALUES($1,$2,$3,$4);
END;
$$ LANGUAGE 'plpgsql' VOLATILE;




CREATE OR REPLACE FUNCTION changre_class_status(INT,INT)
RETURNS VOID AS
$$
BEGIN
 IF $2=0 THEN
    UPDATE tbl_class SET status=1 WHERE class_id=$1;
 ELSE
    UPDATE tbl_class SET status=0 WHERE class_id=$1; 
 END IF;  
END;
$$ LANGUAGE 'plpgsql' VOLATILE;





------------------------------------------------------------------------------------------------------------------------------------------------
----View1 Class Info
-----------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW v_1class_info
AS
SELECT cls.class_id,crs.course_type,cls.class_name,cls.description,cls.class_color
FROM tbl_class cls INNER JOIN tbl_course crs ON cls.course_id=crs.course_id;
------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_1class_info(INT)
RETURNS v_1class_info AS
$$
 SELECT * FROM v_1class_info WHERE class_id=$1
$$ LANGUAGE 'sql' STABLE;

SELECT * FROM get_1class_info(1);







CREATE VIEW v_class_number_student
AS 
SELECT cls.class_id,cls.class_name,"count"(sl.stu_id),cls.class_color,
crs.course_type,gn.generation,cls.status
FROM tbl_class cls LEFT JOIN tbl_selection sl
ON cls.class_id=sl.class_id 
LEFT JOIN tbl_students stu
ON sl.stu_id=stu.stu_id
LEFT JOIN tbl_course crs ON cls.course_id=crs.course_id
LEFT JOIN tbl_generation gn ON crs.g_id=gn.g_id
GROUP BY cls.class_id,crs.course_type,gn.generation
ORDER BY cls.class_id;
  
CREATE or REPLACE FUNCTION get_number_student_in_class(VARCHAR,VARCHAR,VARCHAR)
RETURNS SETOF v_class_number_student AS
$$
  SELECT * FROM v_class_number_student WHERE course_type LIKE $2 AND generation LIKE $1 AND status::INT::TEXT LIKE $3
$$ LANGUAGE 'sql' STABLE;

-----------------------------------------------
---------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_list_student_in_class AS
SELECT st.stu_id,st.profilesrc,st.first_name,st.last_name AS name,st.gender,gn.generation,
       crs.course_type,cls.class_name,st.university,st.email,st.phone,cls.class_id 
FROM tbl_students st INNER JOIN tbl_selection sl ON st.stu_id=sl.stu_id
INNER JOIN tbl_class cls ON sl.class_id=cls.class_id
INNER JOIN tbl_course crs ON st.course_id=crs.course_id
INNER JOIN tbl_generation gn ON crs.g_id=gn.g_id;


CREATE OR REPLACE FUNCTION get_student_in_class(INT)
RETURNS setof v_list_student_in_class AS
$$
 SELECT * FROM v_list_student_in_class WHERE class_id=$1
$$ LANGUAGE 'sql' STABLE;


--------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_class_info(INT,VARCHAR,VARCHAR,INT,TEXT)
RETURNS VOID AS
$$
BEGIN
    UPDATE tbl_class
    SET class_name=$2,
        class_color=$3,
        course_id=$4,
        description=$5
    WHERE class_id=$1;   
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
