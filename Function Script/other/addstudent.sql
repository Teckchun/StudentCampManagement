-----------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION 
add_student(char(6),VARCHAR,VARCHAR,VARCHAR,VARCHAR,
            CHAR(2),DATE,VARCHAR,TEXT,INT,VARCHAR,VARCHAR,
            VARCHAR,VARCHAR,VARCHAR,VARCHAR,TEXT,VARCHAR,
            VARCHAR,VARCHAR,VARCHAR,VARCHAR)
RETURNS VOID AS
$$
BEGIN
INSERT INTO tbl_students(stu_id,first_name,last_name,username,pwd,gender,DOB,POB,permanent_add,course_id
,phone,email,father_name,father_phone,mother_name,mother_phone,parents_add,emergency_contact,university,
usersrc,profilesrc,bgsrc)
VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22);
END;
$$ LANGUAGE 'plpgsql' VOLATILE;

----------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_max_student_id()
RETURNS VARCHAR(6) AS
$$
BEGIN
RETURN(SELECT "max"(stu_id) FROM tbl_students);
END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT get_max_student_id();


----------------------------------------------------------------------------------------------------------------------------------------------
----Update Student
----------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION 
update_student(char(6),VARCHAR,VARCHAR,CHAR(2),DATE
            ,VARCHAR,TEXT,INT,VARCHAR,VARCHAR,
            VARCHAR,VARCHAR,VARCHAR,VARCHAR,TEXT,VARCHAR,
            VARCHAR,VARCHAR)
RETURNS VOID AS
$$
BEGIN
	UPDATE tbl_students
	SET 
		first_name=$2,
		last_name=$3,
		gender=$4,
		DOB=$5,
		POB=$6,
		permanent_add=$7,
		course_id=$8,
		phone=$9,
		email=$10,
		father_name=$11,
		father_phone=$12,
		mother_name=$13,
		mother_phone=$14,
		parents_add=$15,
		emergency_contact=$16,
		university=$17,
		profilesrc=$18
  WHERE stu_id=$1; 
END;
$$ LANGUAGE 'plpgsql' VOLATILE;


-----------------------------------------------------------------------------------------------------------------------------------------------
-----Get Number Row In Student
-----------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_nrow_student_table()
RETURNS VARCHAR(6) AS
$$
BEGIN
RETURN(SELECT "count"(stu_id) FROM tbl_students);
END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT get_nrow_student_table();


CREATE VIEW v_class_in_course
AS 
SELECT class_id,class_name,course_id
FROM tbl_class;
-------------------------------------------------------------------------------------------------------------------------
CREATE  or REPLACE FUNCTION get_class_in_course(INT)
RETURNS SETOF v_class_in_course AS
$$
 SELECT * FROM v_class_in_course WHERE course_id=$1
$$ LANGUAGE 'sql' STABLE;










-----------------------------------------------------------------------------------------------------------------------------------------
------Insert Selection
----------------------------------------------------------------------------------------------------------------------------------------
create OR REPLACE FUNCTION add_selection(char(6),int)
RETURNS Void AS
$$
BEGIN
 INSERT INTO tbl_selection(stu_id,class_id) VALUES($1,$2);
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
-----------------------------------------------------------------------------------------------------------------------------------------
---Update Selection
----------------------------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION update_selection(VARCHAR(6),INT)
RETURNS VOID AS
$$
BEGIN
  UPDATE tbl_selection SET class_id=$2 WHERE stu_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
----------------------------------------------------------------------------------------------------------------------------------------