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