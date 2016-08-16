

--TABLE GERNERATION 
CREATE TABLE tbl_generation (
	g_id SERIAL  PRIMARY KEY,
	generation VARCHAR (20),
	orientation_date DATE,
	finish_date DATE,
	discription TEXT,
	status SMALLINT DEFAULT 1,
    create_date DATE default current_date
);

--TABLE COURSE
CREATE TABLE tbl_course (
	course_id SERIAL PRIMARY KEY,
	course_type VARCHAR (20),
	description TEXT,
	start_date DATE,
	end_date DATE,
	g_id INTEGER REFERENCES tbl_generation(g_id),
    create_date DATE default current_date,
    status SMALLINT DEFAULT 1
);

--TABLE CLASS
CREATE TABLE tbl_class (
	class_id SERIAL PRIMARY KEY,
	class_name VARCHAR (50),
	class_color VARCHAR(10),
	course_id INTEGER REFERENCES tbl_course(course_id),
	create_date DATE default current_date,
	description TEXT,
    status SMALLINT DEFAULT 1
);


--TABLE STUDENT
CREATE TABLE tbl_students (
	stu_id char(7) PRIMARY KEY,
	first_name VARCHAR (20),
	last_name VARCHAR (20),
	username VARCHAR (50),
	pwd VARCHAR(50),
	gender VARCHAR(2),
	DOB DATE,
	POB VARCHAR (150),
	permanent_add TEXT,
    course_id INTEGER REFERENCES tbl_course(course_id),
	phone VARCHAR (20),
	email VARCHAR (100),
	father_name VARCHAR (40),
	father_phone VARCHAR (20),
	mother_name VARCHAR (40),
	mother_phone VARCHAR (20),
	parents_add TEXT,
	emergency_contact VARCHAR (20),
	university VARCHAR (50),
	register_date DATE default current_date,
	usersrc VARCHAR(200),
	profilesrc VARCHAR(200),
    bgsrc varchar(200),
    status SMALLINT DEFAULT 1
);

CREATE TABLE tbl_selection (
	select_id SERIAL PRIMARY KEY,
	stu_id char(7) REFERENCES tbl_students(stu_id),
	class_id INTEGER REFERENCES tbl_class(class_id)
);


--TABLE STAFFS
CREATE TABLE tbl_staffs (
	staff_id char(6) PRIMARY KEY,
	stf_name VARCHAR (20),
	gender CHAR(2),
	username VARCHAR (50),
	pwd VARCHAR(50),
	DOB DATE,
	address TEXT,
	email VARCHAR (100),
	phone VARCHAR (20),
    register_date DATE default current_date,
    usersrc VARCHAR(200),
	profilesrc VARCHAR(200),
    bgsrc varchar(200),
	position VARCHAR(20),
    status SMALLINT DEFAULT 1
);


--TABLE SUBJECT
CREATE TABLE tbl_subjects (
	subject_id char(6) PRIMARY KEY,
	subject_name VARCHAR (20),
	creat_date DATE default(now()),
	score_percent  DECIMAL(4,2),
	description TEXT,
    status SMALLINT DEFAULT 1
);

--TABLE SELECTION SUB , CLASS, STAFF
CREATE TABLE tbl_subjectselection (
	subselect_id SERIAL PRIMARY KEY,
	subject_id char(6) REFERENCES tbl_subjects(subject_id),
	class_id INTEGER REFERENCES tbl_class(class_id),
	staff_id char(6) REFERENCES tbl_staffs(staff_id),
	create_date DATE default(now())
);

--TABLE SCORE
CREATE TABLE tbl_score (
	score_id SERIAL PRIMARY KEY,
	score_date DATE default current_date,
	score_month VARCHAR(20),
	score  DECIMAL(4,2),
	subject_id char(6) REFERENCES tbl_subjects(subject_id),
	student_id char(7) REFERENCES tbl_students(stu_id),
    staff_id char(6) REFERENCES tbl_staffs(staff_id)
);

--TABLE ATTENDANCE
CREATE TABLE tbl_attendance (
	attendance_id SERIAL PRIMARY KEY,
	att_date DATE default current_date,
	stu_id char(6) REFERENCES tbl_students(stu_id),
	description TEXT,
	absence SMALLINT DEFAULT 0,
	permission SMALLINT DEFAULT 0,
	late SMALLINT DEFAULT 0
);

-----------------------------------------------------------------------------------------------------------------------
----Create Table notification
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbl_notification
( id serial PRIMARY KEY,
  for_id CHAR(6) REFERENCES tbl_students(stu_id),
  notification SMALLINT DEFAULT 0
);
---------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbl_message(
  msm_id char(8) PRIMARY KEY,
  sender_id CHAR(6) REFERENCES tbl_staffs(staff_id),
  title VARCHAR(150),
  description TEXT,
  img_info TEXT,
  post_time TIME DEFAULT now() ,
  post_date Date DEFAULT now()
);
------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbl_user_message(
  id serial PRIMARY KEY,
  user_id CHAR(6) REFERENCES tbl_students(stu_id),
  sms_id CHAR(8) REFERENCES tbl_message(msm_id),
  status SMALLINT DEFAULT 1
);












--ATTENDANCE
CREATE OR REPLACE FUNCTION addattendance_absence(date,CHAR(10),INT)
RETURNS void AS
$$
	INSERT INTO tbl_attendance(att_date,stu_id,absence)
	VALUES($1,$2,$3)
$$
LANGUAGE 'sql' VOLATILE; 

CREATE OR REPLACE FUNCTION addattendance_permission(date,CHAR(10),INT)
RETURNS void AS
$$
	INSERT INTO tbl_attendance(att_date,stu_id,permission)
	VALUES($1,$2,$3)
$$
LANGUAGE 'sql' VOLATILE; 


CREATE OR REPLACE FUNCTION addattendance_late(date,CHAR(10),INT)
RETURNS void AS
$$
	INSERT INTO tbl_attendance(att_date,stu_id,late)
	VALUES($1,$2,$3)
$$
LANGUAGE 'sql' VOLATILE; 


CREATE OR REPLACE FUNCTION delete_attendance(INT)
RETURNS SETOF VOID AS
$$
	DELETE FROM tbl_attendance WHERE attendance_id = $1;
$$
LANGUAGE 'sql' VOLATILE;



CREATE OR REPLACE VIEW select_attendance AS
SELECT stu.last_name || ' ' || stu.first_name AS fullname, att.att_date, att.absence, att.permission, att.late,att.attendance_id
FROM tbl_attendance att INNER JOIN tbl_students stu
ON att.stu_id = stu.stu_id
 ORDER BY att.att_date;


CREATE OR REPLACE FUNCTION select_attendancef()
RETURNS SETOF select_attendance AS
$$
	SELECT * FROM select_attendance;
$$
LANGUAGE 'sql' STABLE;


CREATE OR REPLACE VIEW select_attendancelist AS
SELECT att.attendance_id, stu.last_name || ' ' || stu.first_name AS fullname, 
att.att_date, att.absence, att.permission, att.late 
FROM tbl_attendance att INNER JOIN tbl_students stu
ON att.stu_id = stu.stu_id
ORDER BY att.att_date;

CREATE OR REPLACE FUNCTION select_attendancelistf(date)
RETURNS SETOF select_attendancelist AS
$$
	SELECT * FROM select_attendancelist 
	WHERE att_date = $1
$$
LANGUAGE 'sql' STABLE;
--CLOST ATTENDANCE

--CLASS

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

--CLOSE CLASS


--COURSE

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

--CLOSE COURSE
--STAFF

CREATE OR REPLACE FUNCTION add_staff(char(5),VARCHAR,char(2),VARCHAR,VARCHAR,DATE,TEXT,VARCHAR,
VARCHAR,VARCHAR,VARCHAR,VARCHAR,VARCHAR) RETURNS VOID AS
$$
BEGIN
INSERT INTO 
tbl_staffs(staff_id,stf_name,gender,username,pwd,DOB,address,email,phone,usersrc,profilesrc,bgsrc,position)
VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13); 
END;
$$ LANGUAGE 'plpgsql' VOLATILE;


CREATE or REPLACE FUNCTION chage_staff_status(VARCHAR(5),INT)
RETURNS VOID AS
$$
BEGIN
  IF $2=0 THEN
     UPDATE tbl_staffs SET status=1 WHERE staff_id=$1;
  ELSE
     UPDATE tbl_staffs SET status=0 WHERE staff_id=$1;
  END IF;
END; 
$$ LANGUAGE 'plpgsql' VOLATILE;



----------------------------------------------------------------------------------------------------------------------
--View For Staff Info
-----------------------------------------------------------------------------------------------------------------------
CREATE VIEW v_staff_info
AS SELECT staff_id,profilesrc,stf_name,gender,email,phone,position,status from tbl_staffs;
-----------------------------------------------------------------------------------------------------------------
----View Get 1 Staff
-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW v_1staff_info AS
SELECT staff_id,stf_name,gender,dob,address,email,phone,profilesrc,position
FROM tbl_staffs;

CREATE OR REPLACE FUNCTION get_1staff_info(char(5))
RETURNS SETOF v_1staff_info AS
$$
 SELECT * FROM v_1staff_info WHERE staff_id=$1
$$ LANGUAGE 'sql' STABLE;

-------------------------------------------------------------------------------------------------------------------------------
----Get Active
-------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW v_active_staff
AS SELECT stf_name FROM tbl_staffs WHERE status=1;

CREATE OR REPLACE FUNCTION get_active_staff()
RETURNS SETOF v_active_staff AS
$$
  SELECT * from v_active_staff
$$ LANGUAGE 'sql' STABLE;


CREATE OR REPLACE FUNCTION get_max_staff_id()
RETURNS CHAR(5) AS
$$
BEGIN
RETURN (SELECT "max"(staff_id) FROM tbl_staffs);
END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT get_max_staff_id();





------------------------------------------------------------------------------------------------------------------------------
---Get Stafff Info
------------------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION get_staff_info()
RETURNS SETOF v_staff_info AS
$$
 SELECT * FROM v_staff_info
$$ LANGUAGE 'sql' STABLE;



--------------------------------------------------------------------------------------------------------------------------
---Get Number of Row
--------------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION number_of_row_stafftbl()
RETURNS INT AS
$$
BEGIN
RETURN(SELECT "count"(staff_id) FROM tbl_staffs);
END;
$$ LANGUAGE 'plpgsql' STABLE;




CREATE OR REPLACE FUNCTION update_staff(char(5),VARCHAR,char(2),DATE,TEXT,VARCHAR,
VARCHAR,VARCHAR,VARCHAR) RETURNS VOID AS
$$
BEGIN
	UPDATE tbl_staffs
	SET stf_name=$2,
		gender=$3,
		DOB=$4,
		address=$5,
		email=$6,
		phone=$7,
		profilesrc=$8,
		position=$9
	WHERE staff_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;

SELECT number_of_row_stafftbl();


--CLOSE STAFF

--SUBJECT

--view
CREATE OR REPLACE VIEW v_1subject_info
AS 
SELECT subject_id,subject_name,creat_date,description,score_percent FROM tbl_subjects;
--funciton
CREATE OR REPLACE FUNCTION get_1subject_info(VARCHAR)
RETURNS v_1subject_info as 
$$
  SELECT * FROM v_1subject_info WHERE subject_id=$1
$$ LANGUAGE 'sql' STABLE;




CREATE OR REPLACE FUNCTION get_max_subject_id()
RETURNS CHAR(5) AS
$$
BEGIN
  RETURN(SELECT "max"(subject_id) FROM tbl_subjects);
END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT get_max_subject_id();





CREATE or REPLACE FUNCTION get_num_of_row_subject_table()
RETURNS Int AS
$$
BEGIN
 RETURN(SELECT "count"(subject_id) FROM tbl_subjects);
END;
$$ LANGUAGE 'plpgsql' STABLE;
--CLOSE SUBJECT

--DASHBOARD

--courseuser
CREATE OR REPLACE VIEW count_user AS
SELECT 
	(SELECT COUNT(*) from tbl_staffs)  + 
	(SELECT COUNT(*) from tbl_students) as total;
	
CREATE OR REPLACE FUNCTION count_userf()
RETURNS count_user AS
$$
	SELECT * FROM count_user;
$$
LANGUAGE 'sql' STABLE;


CREATE OR REPLACE VIEW get_topStudent AS
SELECT CONCAT(stu.last_name,' ',stu.first_name),stu.stu_id ,sco1.score_month,sco1.toalscore,stu.profilesrc 
				FROM tbl_students stu INNER JOIN tbl_selection sel ON stu.stu_id=sel.stu_id 
				INNER JOIN tbl_class cls  ON sel.class_id=cls.class_id 
				INNER JOIN tbl_course cou ON cou.course_id=cls.course_id 
				INNER JOIN tbl_generation gen ON gen.g_id=cou.g_id 
				INNER JOIN (SELECT sum(sco.score) toalscore,sco.student_id,sco.score_month from tbl_score sco GROUP BY  sco.student_id,sco.score_month) sco1 
				ON sco1.student_id=stu.stu_id WHERE  cou.status=1  

ORDER BY sco1.toalscore DESC 
	LIMIT 6;	
CREATE OR REPLACE FUNCTION get_heightscore()
RETURNS SETOF  get_topstudent AS
$$
	SELECT * FROM get_topstudent
$$
LANGUAGE 'sql' STABLE;

--newstaff
CREATE OR REPLACE VIEW select_newstaff AS
SELECT st.stf_name,
    st.profilesrc
   FROM tbl_staffs st ORDER BY st.register_date DESC
 LIMIT 6;

CREATE OR REPLACE FUNCTION new_user() 
RETURNS SETOF select_newstaff AS
$$ 
 select * from select_newstaff;
$$
LANGUAGE 'sql' STABLE;
--CLOSE DASHBOARD

--GENERATION
CREATE OR REPLACE FUNCTION add_generation(VARCHAR,DATE,DATE,Text)
RETURNS VOID AS
$$
INSERT INTO tbl_generation(generation,orientation_date,finish_date,discription)
VALUES($1,$2,$3,$4)
$$
LANGUAGE 'sql' VOLATILE;

CREATE VIEW v_1generaton_info
AS 
SELECT g_id,generation,orientation_date,finish_date,discription
FROM tbl_generation;
CREATE OR REPLACE FUNCTION get_1generation_info(INT)
RETURNS v_1generaton_info as 
$$
  SELECT * FROM v_1generaton_info WHERE g_id=$1
$$ LANGUAGE 'sql' STABLE;


CREATE VIEW v_active_generation
AS SELECT g_id,generation FROM tbl_generation WHERE status=1;

CREATE OR REPLACE FUNCTION get_active_generation()
RETURNS SETOF v_active_generation AS
$$
 SELECT * FROM v_active_generation
$$ LANGUAGE 'sql' STABLE;


CREATE OR REPLACE FUNCTION get_all_generation()
RETURNS SETOF tbl_generation AS
$$
SELECT * FROM tbl_generation order by g_id
$$
LANGUAGE 'sql' STABLE;

SELECT * FROM get_all_generation();


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

--CLOSE GENDERTION

--OTHERS
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
------------------------------------------------------------------------------------------------------------------------
--View Course in Generation
----------------------------------------------------------------------------------------------------------------------
CREATE VIEW v_course_in_generation
AS
SELECT crs.course_id,crs.course_type,crs.g_id
FROM tbl_course crs;

CREATE OR REPLACE FUNCTION get_course_in_generation(INT)
RETURNS SETOF v_course_in_generation AS
$$
 SELECT * FROM v_course_in_generation WHERE g_id=$1
$$ LANGUAGE 'sql' STABLE;

SELECT * FROM get_course_in_generation(5);
--------------------------------------------------------------------------------------------------------------------
----List Course
--------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-----View List Course Typpe
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE view v_list_course_type
AS
SELECT course_id,course_type
FROM tbl_course WHERE status=1;


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





-------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
----Get Student info to controls
---------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW v_for_update_studennt
AS SELECT
stu.stu_id,stu.first_name,stu.last_name,stu.gender,stu.dob,stu.pob,stu.permanent_add,stu.course_id,
stu.phone,stu.email,stu.father_name,stu.father_phone,stu.mother_name,stu.mother_phone,stu.parents_add,
stu.emergency_contact,stu.university,stu.profilesrc,cls.class_id 
FROM tbl_students stu 
INNER JOIN tbl_selection sl ON stu.stu_id=sl.stu_id
INNER JOIN tbl_class cls ON sl.class_id=cls.class_id ORDER BY stu.stu_id;





CREATE OR REPLACE FUNCTION get_student_to_controls(CHAR(6))
RETURNS SETOF v_for_update_studennt AS
$$
 SELECT * FROM v_for_update_studennt WHERE stu_id=$1
$$ LANGUAGE 'sql' VOLATILE;




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

--CLOSE OTHERS
CREATE OR REPLACE VIEW v_student_attendent As
SELECT stu.stu_id,stu.profilesrc,stu.last_name || '  '|| stu.first_name as Name,stu.gender,cls.class_name as Cls_Name,att.att_date AS date,
"sum"(permission) as Permission,"sum"(absence) As Absent,"sum"(late) AS Late
FROM tbl_attendance att RIGHT JOIN tbl_students stu
INNER JOIN tbl_selection sls ON stu.stu_id=sls.stu_id
INNER JOIN tbl_class cls ON sls.class_id=cls.class_id
ON att.stu_id=stu.stu_id
WHERE stu.status=1
GROUP BY stu.stu_id,att.att_date,cls.class_name;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION get_student_attendent(DATE,DATE)
RETURNS Table(st_id CHAR(6),profile VARCHAR,stu_name TEXT,st_gender VARCHAR,clas_name VARCHAR,att_date TEXT,stu_absent INT,stu_permission INT,stu_late INT) AS 
$$
   BEGIN
   return query SELECT stu_id,profilesrc,"name",gender,cls_name,$1::TEXT || ' to ' || $2::TEXT,"sum"("absent")::int,"sum"(permission)::int,"sum"(late)::int
   FROM v_student_attendent WHERE "date">=$1 AND "date"<=$2
   GROUP BY stu_id,cls_name,"name",gender,profilesrc;
END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT * FROM  get_student_attendent('2015-05-01','2020-05-31');



------------------------------------------------------------------------------------------------------------------------------------------

--Get number notification
---------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_number_notification(char(6))
RETURNS INT AS
$$
BEGIN
  RETURN(SELECT notification FROM tbl_notification WHERE for_id=$1);
END;
$$ LANGUAGE 'plpgsql' STABLE;
----------------------------------------------------------------------------------------------------------------
----Add Notification
-----------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION increase_notification()
RETURNS VOID AS
$$
BEGIN
 UPDATE tbl_notification SET notification=notification+1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
-------------------------------------------------------------------------------------------------------------------
--Descrease Notification
---------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION descrease_notification(char(6))
RETURNS VOID AS
$$
BEGIN
 UPDATE tbl_notification SET notification=notification-1 WHERE for_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
-------------------------------------------------------------------------------------------------------------------
----Get max message id
------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_max_message_id()
RETURNS CHAR(8) AS
$$
BEGIN
 RETURN(SELECT "max"(msm_id) FROM tbl_message);
END;
$$ LANGUAGE 'plpgsql' STABLE;
-----------------------------------------------------------------------------------------------------------------
---Get Number row in table
-----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_number_row_message_table()
RETURNS INT AS
$$
BEGIN
 RETURN(SELECT "count"(msm_id) FROM tbl_message);
END;
$$ LANGUAGE 'plpgsql' STABLE;
-----------------------------------------------------------------------------------------------------------------
----Save Message
-----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION save_message(char(8),char(5),VARCHAR,TEXT,VARCHAR)
RETURNS VOID AS
$$
DECLARE
 nrow INT;
BEGIN
 INSERT INTO tbl_message(msm_id,sender_id,title,description,img_info) VALUES($1,$2,$3,$4,$5);
 nrow:=(SELECT "count"(stu_id) FROM tbl_students WHERE status=1);
  FOR i IN 0..nrow-1 LOOP  
      INSERT INTO tbl_user_message(user_id)
      SELECT stu_id FROM tbl_students WHERE status=1 ORDER BY stu_id LIMIT 1 OFFSET i;
      UPDATE tbl_user_message SET sms_id=$1 WHERE id=(SELECT "max"(id) FROM tbl_user_message);   
  END LOOP;    
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
-----------------------------------------------------------------------------------------------------------------------------------------
----Save Notification
------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION save_notification(CHAR(6))
RETURNS VOID AS
$$
BEGIN
  INSERT INTO tbl_notification(for_id) VALUES($1);
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
--------------------------------------------------------------------------------------------------------------------------------------------
-----View Get Message
---------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_message
AS
SELECT um.user_id,um.sms_id,ms.title,ms.description,stf.stf_name,ms.post_time
,um.status,stf.profilesrc,ms.img_info,ms.post_date
FROM tbl_user_message um
INNER JOIN tbl_message ms ON um.sms_id=ms.msm_id
INNER JOIN tbl_staffs stf ON ms.sender_id=stf.staff_id;

CREATE OR REPLACE VIEW v_message_info
AS
SELECT ms.msm_id,stf.stf_name,ms.title,ms.description,ms.img_info,ms.post_date,ms.post_time,stf.profilesrc
FROM tbl_message ms
INNER JOIN tbl_staffs stf ON ms.sender_id=stf.staff_id;
----------------------------------------------------------------------------------------------------------------------------------------------
-----------Function Get Message
---------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_message(char(6))
RETURNS SETOF v_message
AS 
$$
 SELECT * FROM v_message WHERE user_id=$1 ORDER BY sms_id
$$ LANGUAGE 'sql' STABLE;

CREATE OR REPLACE FUNCTION get_message()
RETURNS SETOF v_message_info
AS 
$$
 SELECT * FROM v_message_info ORDER BY msm_id DESC
$$ LANGUAGE 'sql' STABLE;

CREATE OR REPLACE FUNCTION get_1message_info(CHAR(8))
RETURNS SETOF v_message_info
AS 
$$
 SELECT * FROM v_message_info WHERE msm_id=$1
$$ LANGUAGE 'sql' STABLE;
----------------------------------------------------------------------------------------------------------------------------------------------
--Change message status for user
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION change_message_for_user(CHAR(6),CHAR(8))
RETURNS VOID AS
$$
BEGIN
  UPDATE tbl_user_message SET status=0 WHERE user_id=$1 AND sms_id=$2;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
-------------------------------------------------------------------------------------------------------------------------------------------------
---Get Message Statu
------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_message_status(CHAR(6),CHAR(8))
RETURNS INT AS
$$
BEGIN
 RETURN(SELECT status from v_message WHERE user_id=$1 AND sms_id=$2);
END;
$$ LANGUAGE 'plpgsql' STABLE;
--------------------------------------------------------------------------------------------------------------------------------------------------
--Reset Table
-------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION reset_table()
RETURNS void AS
$$
BEGIN
 UPDATE tbl_notification SET notification=0;
 DELETE FROM tbl_user_message;
 DELETE FROM tbl_message;  
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
----------------------------------------------------------------------------------------------------------------------------------------------------
---Delete Message From User
----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION delete_message_from_user(CHAR(6),CHAR(8))
RETURNS VOID AS
$$
BEGIN
  DELETE FROM tbl_user_message WHERE user_id=$1 AND sms_id=$2;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION delete_message_from_user(CHAR(6))
RETURNS VOID AS
$$
BEGIN
  DELETE FROM tbl_user_message WHERE user_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
--------------------------------------------------------------------------------------------------------------------------------------------------
---Chage notification to zero
--------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION change_notification_to_zero(CHAR(6))
RETURNS Void AS
$$
BEGIN
UPDATE tbl_notification SET notification=0 WHERE for_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
---------------------------------------------------------------------------------------------------------------------------------------------------
---Delete Message From User
---------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION delete_message_from_user(CHAR(6))
RETURNS Void AS 
$$
BEGIN
 DELETE FROM tbl_user_message WHERE user_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;
------------------------------------------------------------------------------------------------------------------------------------------------
-----------Get 1 Message
-------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_1message(CHAR(6),CHAR(8))
RETURNS v_message AS
$$
 SELECT * FROM v_message WHERE user_id=$1 AND sms_id=$2
$$ LANGUAGE 'sql' STABLE;
-------------------------------------------------------------------------------------------------------------------------------------------------
