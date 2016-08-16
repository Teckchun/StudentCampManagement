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