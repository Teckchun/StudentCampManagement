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