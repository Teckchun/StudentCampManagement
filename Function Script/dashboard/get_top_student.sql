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