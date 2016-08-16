package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.Score;
import model.dto.Student;
import model.dto.UserInfo;
import Utility.DBConnection;


public class StudentDAO {
    
	public StudentDAO() throws Exception{
		System.out.println("Connecting to database...");
		
	}
	//get username and image to jstl
	public static ArrayList<Object> checkLogin(String name,String pass) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT stu.stu_id,stu.username,stu.usersrc,ge.g_id,ge.generation,cou.course_type FROM tbl_students stu "
				+ "INNER JOIN tbl_course cou ON cou.course_id=stu.course_id "
				+ "INNER JOIN tbl_generation ge ON ge.g_id=cou.g_id "
				+ "WHERE (LOWER(username)=? or email=?) and pwd=? ");
		ps.setString(1, name.toLowerCase());
		ps.setString(2, name);
		ps.setString(3, pass);
		ResultSet rs = ps.executeQuery();
		ArrayList<Object> stulogin=new ArrayList<Object>();
		try{
			while(rs.next()){
				stulogin.add(rs.getString(1));
				stulogin.add(rs.getString(2));
				stulogin.add(rs.getString(3));
				stulogin.add(rs.getString(4));
				stulogin.add(rs.getString(5));
				stulogin.add(rs.getString(6));
				return stulogin;
			}
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return null;
	}
	//refreshing session
		public static ArrayList<Object> refreshSession(String stuid) throws SQLException{
			Connection con=DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("SELECT stu.stu_id,stu.username,stu.usersrc,ge.g_id,ge.generation,cou.course_type FROM tbl_students stu "
					+ "INNER JOIN tbl_course cou ON cou.course_id=stu.course_id "
					+ "INNER JOIN tbl_generation ge ON ge.g_id=cou.g_id "
					+ "WHERE stu_id=? ");
			ps.setString(1, stuid);
			ResultSet rs = ps.executeQuery();
			ArrayList<Object> stulogin=new ArrayList<Object>();
			try{
				while(rs.next()){
					stulogin.add(rs.getString(1));
					stulogin.add(rs.getString(2));
					stulogin.add(rs.getString(3));
					stulogin.add(rs.getString(4));
					stulogin.add(rs.getString(5));
					stulogin.add(rs.getString(6));
					return stulogin;
				}
				
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
				if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
				if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			}
			return null;
		}
	/*Personalinfo page*/
	public static Student getStudentInfo(String stuid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT first_name,last_name,gender,DOB,POB,Permanent_add,phone,email,father_name,father_phone,mother_name,"
				+ "mother_phone,parents_add,emergency_contact,university,profilesrc FROM tbl_students WHERE stu_id=?");
		ps.setString(1, stuid);
		ResultSet rs = ps.executeQuery();
		Student student=new Student();
		try{
			while(rs.next()){
				student.setFname(rs.getString(1));
				student.setLname(rs.getString(2));
				student.setGender(rs.getString(3));
				student.setDob(rs.getDate(4));
				student.setPob(rs.getString(5));
				student.setPaddr(rs.getString(6));
				student.setPhone(rs.getString(7));
				student.setEmail(rs.getString(8));
				student.setFa_name(rs.getString(9));
				student.setFa_phone(rs.getString(10));
				student.setMo_name(rs.getString(11));
				student.setMo_phone(rs.getString(12));
				student.setParents_addr(rs.getString(13));
				student.setEmergency_contact(rs.getString(14));
				student.setUniversit(rs.getString(15));
				student.setProfiles(rs.getString(16));
				
				return student;
			}
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return null;
	}
	public static boolean updateStudentInfo(Student student) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("UPDATE  tbl_students SET first_name=?,last_name=?,gender=?,dob=?,pob=?,permanent_add=?"
				+ ",phone=?,email=?,father_name=?,father_phone=?,mother_name=?,mother_phone=?,parents_add=?,emergency_contact=? WHERE stu_id=? ");
		ps.setString(1, student.getFname());
		ps.setString(2, student.getLname());
		ps.setString(3, student.getGender());
		ps.setDate(4, new java.sql.Date(student.getDob().getTime()));
		ps.setString(5, student.getPob());
		ps.setString(6, student.getPaddr());
		ps.setString(7, student.getPhone());
		ps.setString(8, student.getEmail());
		ps.setString(9, student.getFa_name());
		ps.setString(10, student.getFa_phone());
		ps.setString(11, student.getMo_name());
		ps.setString(12, student.getMo_phone());
		ps.setString(13, student.getParents_addr());
		ps.setString(14, student.getEmergency_contact());
		ps.setString(15, student.getStu_id());
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
		return false;
	}
	
	//close personal info page	
	//Setting informatioin detail
	//viewing user
	public static UserInfo getStudentUser(String stuid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT username,pwd,email,usersrc,bgsrc FROM tbl_students WHERE stu_id=?");
		ps.setString(1, stuid);
		ResultSet rs = ps.executeQuery();
		UserInfo userset=new UserInfo();
		try{
			while(rs.next()){
				
				userset.setUsername(rs.getString(1));
				userset.setPwd(rs.getString(2));
				userset.setEmail(rs.getString(3));
				userset.setUsersrc(rs.getString(4));
				userset.setBgsrc(rs.getString(5));
				return userset;
			}
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return null;
	}
	public static boolean checkPassword(String stuid,String password) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT pwd FROM tbl_students WHERE stu_id=? ");
		ps.setString(1, stuid);
		ResultSet rs = ps.executeQuery();
		
		try{
			while(rs.next()){
				if(rs.getString(1).equals(password)){
					return true;
				}
			}
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return false;
	}
	//closing showing
	public static int checkCourseDate(String stuid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT extract(epoch from (CURRENT_DATE::timestamp - cour.end_date::timestamp)) "
				+ "FROM tbl_students stu INNER JOIN tbl_course cour "
				+ "ON stu.course_id=cour.course_id  "
				+ "WHERE stu.stu_id=?");
		ps.setString(1, stuid);
		ResultSet rs = ps.executeQuery();
		
		try{
			while(rs.next()){
				return rs.getInt(1);
			}
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return 0;
	}
	//updating
	public static boolean updatePassword(String stuid,String Password) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("UPDATE  tbl_students SET pwd=? WHERE stu_id=? ");
		ps.setString(1, Password);
		ps.setString(2, stuid);
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
			
		return false;
	}
	public static boolean updateImageUser(String stuid,String imguser) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("UPDATE  tbl_students SET usersrc=? WHERE stu_id=? ");
		ps.setString(1, imguser);
		ps.setString(2, stuid);
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
			
		return false;
	}
	public static boolean updateBackgroundUser(String stuid,String bguser) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("UPDATE  tbl_students SET bgsrc=? WHERE stu_id=? ");
		ps.setString(1, bguser);
		ps.setString(2, stuid);
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
			
		return false;
	}
	public static boolean updateUserInfo(UserInfo user) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("UPDATE  tbl_students SET username=?,email=? WHERE stu_id=? ");
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getEmail());
		ps.setString(3, user.getUserid());
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
			
		return false;
		
	}
	
	//close updating
	//closing setting
	//student's score detail
	public static ArrayList<Score> listScoreDetail(String stuid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT sco1.score_month,sco1.toalscore "
				+ "FROM tbl_students stu INNER JOIN tbl_selection sel ON stu.stu_id=sel.stu_id "
				+ "INNER JOIN tbl_class cls  ON sel.class_id=cls.class_id "
				+ "INNER JOIN tbl_course cou ON cou.course_id=cls.course_id "
				+ "INNER JOIN tbl_generation gen ON gen.g_id=cou.g_id "
				+ "INNER JOIN (SELECT sum(sco.score) toalscore,sco.student_id,sco.score_month from tbl_score sco GROUP BY  sco.student_id,sco.score_month) sco1 "
				+ "ON sco1.student_id=stu.stu_id WHERE stu.stu_id=?");	
		ps.setString(1, stuid);
		ResultSet rs = ps.executeQuery();
		ArrayList<Score> stuscore=new ArrayList<Score>();
		try{
			while(rs.next()){
				Score score=new Score();
			
				score.setMonth(rs.getString(1));
				
				score.setScore(rs.getFloat(2));
				stuscore.add(score);
			}
			
			return stuscore;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		
	}
	
	public static ArrayList<Score> listScoreSpecificDetail(String stuid,String scoremonth) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT subj.subject_name,s.score "
				+ "FROM tbl_score s LEFT JOIN tbl_subjects subj "
				+ "ON subj.subject_id=s.subject_id "
				+ "WHERE s.student_id=? AND s.score_month=?");	
		ps.setString(1, stuid);
		ps.setString(2, scoremonth);
		ResultSet rs = ps.executeQuery();
		ArrayList<Score> stuscore=new ArrayList<Score>();
		try{
			while(rs.next()){
				Score score=new Score();
				score.setSubject(rs.getString(1));
				score.setScore(rs.getFloat(2));
				stuscore.add(score);
			}
			
			return stuscore;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		
	}
	
	
	
	public static Score getStudentScoreDetail(String stuid) throws SQLException{
	
		Connection con=DBConnection.getConnect();

		PreparedStatement ps = con.prepareStatement("SELECT stu.profilesrc,CONCAT(stu.last_name,' ',stu.first_name),stu.gender,cls.class_name,cou.course_type,gen.generation "
				+ "FROM tbl_students stu INNER JOIN tbl_selection sel ON stu.stu_id=sel.stu_id "
				+ "INNER JOIN tbl_class cls  ON sel.class_id=cls.class_id "
				+ "INNER JOIN tbl_course cou ON cou.course_id=cls.course_id "
				+ "INNER JOIN tbl_generation gen ON gen.g_id=cou.g_id "
				+ "WHERE stu.stu_id=?");	
		ps.setString(1, stuid);
		ResultSet rs = ps.executeQuery();
		
		try{
			while(rs.next()){
				Score score=new Score();
				score.setStu_profile(rs.getString(1));
				score.setStu_name(rs.getString(2));
				score.setStu_gender(rs.getString(3));
				score.setCls_name(rs.getString(4));
				score.setCourse_type(rs.getString(5));
				score.setGeneration_name(rs.getString(6));
				return score;
			}
			
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return null;
	}
	//end student's score detail
	//student result page
	public static ArrayList<Score>  listStudentResult(String generation,String coursetype,String stuclass,String smonth) throws SQLException{
		Connection con=DBConnection.getConnect();
	
		/*PreparedStatement ps = con.prepareStatement("SELECT stu.stu_id"
				+ ",CONCAT(stu.last_name,' ',stu.first_name)"
				+ ",stu.gender"
				+ ",cls.class_name"
				+ ",COALESCE(jsub.JAVA, 0) JAVA"
				+ ",COALESCE(wsub.Web,0) WEB"
				+ ",COALESCE(ksub.Korean,0) KOREAN"
				+ ",COALESCE(attendance.attendent_score,10) attendance_score"
				+ ",(so.total+COALESCE(attendance.attendent_score,10)) TOTAL"
				+ ",so.score_month"
				+ ",g.generation"
				+ ",cour.course_type "
				+ "From tbl_students stu LEFT JOIN(SELECT sum(s.score) total,s.score_month,s.student_id "
				+ "FROM tbl_score s  GROUP BY s.student_id,s.score_month) so "
				+ "ON so.student_id=stu.stu_id  LEFT OUTER JOIN tbl_selection seal "
				+ "ON seal.stu_id=stu.stu_id LEFT OUTER JOIN tbl_class cls "
				+ "ON cls.class_id=seal.class_id LEFT OUTER JOIN tbl_course cour "
				+ "ON cour.course_id=cls.course_id LEFT OUTER JOIN tbl_generation g "
				+ "ON g.g_id = cour.g_id LEFT OUTER JOIN "
				+ "(SELECT sc1.student_id,sc1.score AS Korean FROM tbl_score sc1 "
				+ "WHERE sc1.subject_id='SUB003' AND sc1.score_month = ? ) ksub "
				+ "ON ksub.student_id=stu.stu_id "
				+ "LEFT OUTER JOIN (SELECT sc2.student_id,sc2.score AS Web "
				+ "FROM tbl_score sc2 "
				+ "WHERE sc2.subject_id='SUB001' "
				+ "AND score_month= ? ) wsub "
				+ "ON wsub.student_id=stu.stu_id "
				+ "LEFT OUTER JOIN (SELECT sc2.student_id,sc2.score AS JAVA "
				+ "FROM tbl_score sc2 "
				+ "WHERE sc2.subject_id='SUB002' "
				+ "AND score_month= ? ) jsub "
				+ "ON jsub.student_id=stu.stu_id LEFT OUTER JOIN (SELECT  attd.stu_id,date_part('Month',attd.att_date),"
				+ "CASE "
				+ "WHEN ((((sum(attd.absence))::double precision + ((0.5 * (sum(attd.permission))::numeric))::double precision) + ((0.25 * (sum(attd.late))::numeric))::double precision) > (10)::double precision) THEN 0::double precision "
				+ "ELSE ((10)::double precision - (((sum(attd.absence))::double precision + ((0.5 * (sum(attd.permission))::numeric))::double precision) + ((0.25 * (sum(attd.late))::numeric))::double precision)) "
				+ "END AS attendent_score "
				+ "FROM  tbl_attendance attd  "
				+ "WHERE date_part('Month',attd.att_date) = ? GROUP BY date_part('Month',attd.att_date),attd.stu_id) attendance "
				+ "ON attendance.stu_id=stu.stu_id "
				+ "WHERE g.generation = ? "
				+ "and cour.course_type = ? "
				+ "and so.score_month = ? "
				+ "and cls.class_name like ? "
				+ "ORDER BY TOTAL DESC");*/
		PreparedStatement ps = con.prepareStatement("SELECT stu.stu_id "
				+ ",CONCAT(stu.last_name,' ',stu.first_name)"
				+ ",stu.gender"
				+ ",cls.class_name"
				+ ",COALESCE(jsub.JAVA, 0) JAVA"
				+ ",COALESCE(wsub.Web,0) WEB"
				+ ",COALESCE(ksub.Korean,0) KOREAN"
				+ ",COALESCE(attendance.attendent_score,10) attendance_score"
				+ ",(so.total+COALESCE(attendance.attendent_score,10)) TOTAL"
				
				+ ",so.score_month"
	
				+ ",ROW_NUMBER() OVER(ORDER BY (so.total+COALESCE(attendance.attendent_score,10)) DESC) RANK "
				+ "From tbl_students stu LEFT JOIN(SELECT sum(s.score) total,s.score_month,s.student_id "
				+ "FROM tbl_score s GROUP BY s.student_id,s.score_month) so "
				+ "ON so.student_id=stu.stu_id LEFT OUTER JOIN tbl_selection seal "
				+ "ON seal.stu_id=stu.stu_id LEFT OUTER JOIN tbl_class cls "
				+ "ON cls.class_id=seal.class_id LEFT OUTER JOIN tbl_course cour "
				+ "ON cour.course_id=cls.course_id LEFT OUTER JOIN tbl_generation g "
				+ "ON g.g_id = cour.g_id LEFT OUTER JOIN "
				+ "(SELECT sc1.student_id,sc1.score AS Korean FROM tbl_score sc1 "
				+ "WHERE sc1.subject_id='SUB003' AND sc1.score_month = ? ) ksub "
				+ "ON ksub.student_id=stu.stu_id "
				+ "LEFT OUTER JOIN (SELECT sc2.student_id,sc2.score AS Web "
				+ "FROM tbl_score sc2 "
				+ "WHERE sc2.subject_id='SUB001' "
				+ "AND score_month= ? ) wsub "
				+ "ON wsub.student_id=stu.stu_id "
				+ "LEFT OUTER JOIN (SELECT sc2.student_id,sc2.score AS JAVA "
				+ "FROM tbl_score sc2 "
				+ "WHERE sc2.subject_id='SUB002' "
				+ "AND score_month= ? ) jsub "
				+ "ON jsub.student_id=stu.stu_id LEFT OUTER JOIN (SELECT attd.stu_id,date_part('Month',attd.att_date), "
				+ "CASE "
				+ "WHEN ((((sum(attd.absence))::double precision + ((0.5 * (sum(attd.permission))::numeric))::double precision) + ((0.25 * (sum(attd.late))::numeric))::double precision) > (10)::double precision) THEN 0::double precision "
				+ "ELSE ((10)::double precision - (((sum(attd.absence))::double precision + ((0.5 * (sum(attd.permission))::numeric))::double precision) + ((0.25 * (sum(attd.late))::numeric))::double precision)) "
				+ "END AS attendent_score "
				+ "FROM tbl_attendance attd "
				+ "WHERE date_part('Month',attd.att_date)::INT::TEXT = ? GROUP BY date_part('Month',attd.att_date),attd.stu_id) attendance "
				+ "ON attendance.stu_id=stu.stu_id "
				+ "WHERE g.generation = ? "
				+ "and cour.course_type = ? "
				+ "and so.score_month = ? "
				+ "and cls.class_name like ? "
				+ "ORDER BY TOTAL DESC");
		
	
		
		ps.setString(1,  smonth);
		ps.setString(2,  smonth);
		ps.setString(3,  smonth);
		ps.setString(4, smonth);
		ps.setString(5, generation);
		ps.setString(6, coursetype);
		ps.setString(7, smonth);
		ps.setString(8, stuclass+"%");
		ResultSet rs = ps.executeQuery();
		ArrayList<Score> sturesult=new ArrayList<Score>();
		try{
			while(rs.next()){
			
				
				Score score=new Score();
				score.setStu_id(rs.getString(1));
				score.setStu_name(rs.getString(2));
				score.setStu_gender(rs.getString(3));
				score.setCls_name(rs.getString(4));
				score.setJscore(rs.getFloat(5));
				score.setWscore(rs.getFloat(6));
				score.setKscore(rs.getFloat(7));
				score.setAttscore(rs.getFloat(8));
				score.setScore(rs.getFloat(9));
				score.setMonth(rs.getString(10));
				score.setRank(Integer.parseInt(rs.getString(11)));
				sturesult.add(score);
			}
			
			return sturesult;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		
	}
	public static ArrayList<Score> listAllStudentResult(String generationid,String courseid,String classid,String month) throws SQLException{
		Connection con=DBConnection.getConnect();
	
		PreparedStatement ps = con.prepareStatement("SELECT stu.stu_id "
				+ ",CONCAT(stu.last_name,' ',stu.first_name)"
				+ ",stu.gender"
				+ ",cls.class_name"
				+ ",COALESCE(jsub.JAVA, 0) JAVA"
				+ ",COALESCE(wsub.Web,0) WEB"
				+ ",COALESCE(ksub.Korean,0) KOREAN"
				+ ",COALESCE(attendance.attendent_score,10) attendance_score"
				+ ",(so.total+COALESCE(attendance.attendent_score,10)) TOTAL"
				
				+ ",so.score_month"
				+ ",g.generation"
				+ ",cour.course_type"
				
				+ ",ROW_NUMBER() OVER(ORDER BY (so.total+COALESCE(attendance.attendent_score,10)) DESC) RANK "
				+ "From tbl_students stu LEFT JOIN(SELECT sum(s.score) total,s.score_month,s.student_id "
				+ "FROM tbl_score s GROUP BY s.student_id,s.score_month) so "
				+ "ON so.student_id=stu.stu_id LEFT OUTER JOIN tbl_selection seal "
				+ "ON seal.stu_id=stu.stu_id LEFT OUTER JOIN tbl_class cls "
				+ "ON cls.class_id=seal.class_id LEFT OUTER JOIN tbl_course cour "
				+ "ON cour.course_id=cls.course_id LEFT OUTER JOIN tbl_generation g "
				+ "ON g.g_id = cour.g_id LEFT OUTER JOIN "
				+ "(SELECT sc1.student_id,sc1.score AS Korean FROM tbl_score sc1 "
				+ "WHERE sc1.subject_id='SUB003' AND sc1.score_month = ? ) ksub "
				+ "ON ksub.student_id=stu.stu_id "
				+ "LEFT OUTER JOIN (SELECT sc2.student_id,sc2.score AS Web "
				+ "FROM tbl_score sc2 "
				+ "WHERE sc2.subject_id='SUB001' "
				+ "AND score_month= ? ) wsub "
				+ "ON wsub.student_id=stu.stu_id "
				+ "LEFT OUTER JOIN (SELECT sc2.student_id,sc2.score AS JAVA "
				+ "FROM tbl_score sc2 "
				+ "WHERE sc2.subject_id='SUB002' "
				+ "AND score_month= ? ) jsub "
				+ "ON jsub.student_id=stu.stu_id LEFT OUTER JOIN (SELECT attd.stu_id,date_part('Month',attd.att_date), "
				+ "CASE "
				+ "WHEN ((((sum(attd.absence))::double precision + ((0.5 * (sum(attd.permission))::numeric))::double precision) + ((0.25 * (sum(attd.late))::numeric))::double precision) > (10)::double precision) THEN 0::double precision "
				+ "ELSE ((10)::double precision - (((sum(attd.absence))::double precision + ((0.5 * (sum(attd.permission))::numeric))::double precision) + ((0.25 * (sum(attd.late))::numeric))::double precision)) "
				+ "END AS attendent_score "
				+ "FROM tbl_attendance attd "
				+ "WHERE date_part('Month',attd.att_date)::INT::TEXT = ? GROUP BY date_part('Month',attd.att_date),attd.stu_id) attendance "
				+ "ON attendance.stu_id=stu.stu_id "
				+ "WHERE g.generation like ? "
				+ "and cour.course_type like ? "
				+ "and so.score_month = ? "
				+ "and cls.class_name like ? "
				+ "ORDER BY TOTAL DESC");
		

		ps.setString(1, month);
		ps.setString(2, month);
		ps.setString(3, month);
		ps.setString(4, month);
		ps.setString(5, generationid+"%");
		ps.setString(6,courseid+"%");
		ps.setString(7, month);
		ps.setString(8, classid+"%");
		ResultSet rs = ps.executeQuery();
		ArrayList<Score> sturesult=new ArrayList<Score>();
		try{
			while(rs.next()){
				Score score=new Score();
				score.setStu_id(rs.getString(1));
				score.setStu_name(rs.getString(2));
				score.setStu_gender(rs.getString(3));
				score.setCls_name(rs.getString(4));
				score.setJscore(rs.getFloat(5));
				score.setWscore(rs.getFloat(6));
				score.setKscore(rs.getFloat(7));
				score.setAttscore(rs.getFloat(8));
				score.setScore(rs.getFloat(9));
				score.setMonth(rs.getString(10));
				score.setGeneration_name(rs.getString(11));
				score.setCourse_type(rs.getString(12));
				score.setRank(Integer.parseInt(rs.getString(13)));
				sturesult.add(score);
			}
			
			return sturesult;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
	}
	public static ArrayList<String> listStudentClass(String generation, String course) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT cls.class_name "
				+ "FROM tbl_class cls INNER JOIN tbl_course cou  "
				+ "ON cls.course_id=cou.course_id INNER JOIN tbl_generation g "
				+ "ON  g.g_id=cou.g_id "
				+ "WHERE g.generation=? and course_type=? ");
		ps.setString(1, generation);
		ps.setString(2, course);
		
		ResultSet rs = ps.executeQuery();
		ArrayList<String> stuclass=new ArrayList<String>();
		try{
			while(rs.next()){
				stuclass.add(rs.getString(1));
				
			}
			return stuclass;
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		
	}
	public static ArrayList<Student> listAllHRDStudent(String generation,String course,String classid,String status) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT stu.stu_id,stu.profilesrc,CONCAT(stu.last_name,' ',stu.first_name),stu.gender,cour.course_type,g.generation,cls.class_name,stu.status "
				+ "FROM tbl_students stu "
				+ " LEFT JOIN tbl_selection sel ON sel.stu_id=stu.stu_id  "
				+ "LEFT JOIN tbl_class cls ON cls.class_id=sel.class_id "
				+ "LEFT JOIN tbl_course cour ON cour.course_id=cls.course_id "
				+ "LEFT JOIN tbl_generation g ON g.g_id=cour.g_id  "
				+ "WHERE g.generation LIKE ? and cour.course_type LIKE ? and cls.class_name LIKE ? and stu.status::INT::TEXT LIKE ?");
		ps.setString(1, generation+"%");
		ps.setString(2, course+"%");
		ps.setString(3, classid+"%");
		ps.setString(4, status+"%");
		ResultSet rs = ps.executeQuery();
		ArrayList<Student> stuclass=new ArrayList<Student>();
		try{
			while(rs.next()){
				Student student=new Student();
				student.setStu_id(rs.getString(1));
				student.setProfiles(rs.getString(2));
				student.setFname(rs.getString(3));
				student.setGender(rs.getString(4));
				student.setCourse(rs.getString(5));
				student.setG_name(rs.getString(6));
				student.setClass_name(rs.getString(7));
				student.setStatus(rs.getInt(8));
				
				stuclass.add(student);
				
			}
			return stuclass;
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		
	}
	
	
	//end student result page
	//printing transcript
	public boolean printTranscriptStudent(){
		
		return false;
	}
	//ADd Student
	public boolean insertStutoNoti(String stuid){
		Connection con=DBConnection.getConnect();
		try {
			con.setAutoCommit(false);
			PreparedStatement pstmt=con.prepareStatement("INSERT INTO tbl_notification(for_id) VALUES(?)");
			pstmt.setString(1, stuid);
			if (pstmt.executeUpdate()>0) {
				con.commit();
				
				return true;
			} else {
				con.rollback();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public boolean addStudent(Student st,int class_id) {
		Connection con=DBConnection.getConnect();
		try {
			con.setAutoCommit(false);
			CallableStatement insert = con.prepareCall("{call add_student(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			insert.setString(1, st.getStu_id());
			insert.setString(2, st.getFname());
			insert.setString(3, st.getLname());
			insert.setString(4, st.getUsername());
			insert.setString(5, st.getPwd());
			insert.setString(6, st.getGender() + "");
			insert.setDate(7, new java.sql.Date(st.getDob().getTime()));
			insert.setString(8, st.getPob());
			insert.setString(9, st.getPaddr());
			insert.setInt(10, st.getCourse_id());
			insert.setString(11, st.getPhone());
			insert.setString(12, st.getEmail());
			insert.setString(13, st.getFa_name());
			insert.setString(14, st.getFa_phone());
			insert.setString(15, st.getMo_name());
			insert.setString(16, st.getMo_phone());
			insert.setString(17, st.getParents_addr());
			insert.setString(18, st.getEmergency_contact());
			insert.setString(19, st.getUniversit());
			insert.setString(20, st.getImg());
			insert.setString(21, st.getProfiles());
			insert.setString(22,st.getBg_img());
			if (insert.execute()) {
				con.commit();
				new StudentDAO().addSelection(st.getStu_id(),class_id);
				new StudentDAO().insertStutoNoti(st.getStu_id());
				return true;
			} else {
				con.rollback();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	//Add Selecttion
	public boolean addSelection(String stu_id,int class_id){
		Connection con=DBConnection.getConnect();
		   try{
			   con.setAutoCommit(false);
			   CallableStatement adds=con.prepareCall("{call add_selection(?,?)}");
			   adds.setString(1,stu_id);
			   adds.setInt(2,class_id);
			   if(adds.execute()){
				   con.commit();
				   return true;
			   }else{
				   con.rollback();
			   }
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		   return false;
	}
	public String getStudentID() throws Exception {
		int row = new StudentDAO().getNumberofRow();
		String stid = "";
		Connection con=DBConnection.getConnect();
		try {
			CallableStatement id = con.prepareCall("{call get_max_student_id()}");
			id.execute();
			ResultSet rs = id.getResultSet();
			if (rs.next() && row != 0) {
				String stu_id = rs.getString(1).substring(3).trim();
				int id1 = Integer.parseInt(stu_id);
				if (id1 < 9) {
					id1 += 1;
					stid += "ST000" + id1;
				} else if (id1 < 98) {
					id1 += 1;
					stid += "ST00" + id1;
				} else if (id1 < 998) {
					id1 += 1;
					stid += "ST0" + id1;
				}else if(id1<9998){
					id1 += 1;
					stid += "ST" + id1;
				}
			} else {
				stid = "ST0001";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return stid;
	}
	public int getNumberofRow() {
		int row = 0;
		Connection con=DBConnection.getConnect();
		try {
			CallableStatement nr = con.prepareCall("{call get_nrow_student_table()}");
			nr.execute();
			ResultSet rs = nr.getResultSet();
			if (rs.next()) {
				row = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return row;
	}
	public boolean updateStudent(Student st,int class_id) {
		Connection con=DBConnection.getConnect();
		try {
			con.setAutoCommit(false);
			CallableStatement insert = con.prepareCall("{call update_student(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			insert.setString(1, st.getStu_id());
			insert.setString(2, st.getFname());
			insert.setString(3, st.getLname());
			insert.setString(4, st.getGender() + "");
			insert.setDate(5, new java.sql.Date(st.getDob().getTime()));
			insert.setString(6, st.getPob());
			insert.setString(7, st.getPaddr());
			insert.setInt(8, st.getCourse_id());
			insert.setString(9, st.getPhone());
			insert.setString(10, st.getEmail());
			insert.setString(11, st.getFa_name());
			insert.setString(12, st.getFa_phone());
			insert.setString(13, st.getMo_name());
			insert.setString(14, st.getMo_phone());
			insert.setString(15, st.getParents_addr());
			insert.setString(16, st.getEmergency_contact());
			insert.setString(17, st.getUniversit());
			insert.setString(18, st.getProfiles());
			if (insert.execute()){
				con.commit();
				new StudentDAO().updateSelection(st.getStu_id(),class_id);
				return true;
			} else {
				con.rollback();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public boolean updateSelection(String stu_id,int class_id){
		Connection con=DBConnection.getConnect();
		   try{
			   con.setAutoCommit(false);
			   CallableStatement up_sel=con.prepareCall("{call update_selection(?,?)}");
			   up_sel.setString(1,stu_id);
			   up_sel.setInt(2,class_id);
			   if(up_sel.execute()){
				   con.commit();
				   return true;
			   }else{
				   con.rollback();
			   }
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }finally{
			   try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		   }
		   return false;
	}
	public Student getStudent(String id){
		Connection con=DBConnection.getConnect();
		Student st=null;
		   try{
			   CallableStatement getstu=con.prepareCall("{call get_student_to_controls(?)}");
			   getstu.setString(1, id);
			   getstu.execute();
			   ResultSet rs=getstu.getResultSet();
			   if(rs.next()){
				   st=new Student();
				   st.setStu_id(rs.getString(1));
				   st.setFname(rs.getString(2));
				   st.setLname(rs.getString(3));
				   st.setGender(rs.getString(4));
				   st.setDob(rs.getDate(5));
				   st.setPob(rs.getString(6));
				   st.setPaddr(rs.getString(7));
				   st.setCourse_id(rs.getInt(8));
				   st.setPhone(rs.getString(9));
				   st.setEmail(rs.getString(10));
				   st.setFa_name(rs.getString(11));
				   st.setFa_phone(rs.getString(12));
				   st.setMo_name(rs.getString(13));
				   st.setMo_phone(rs.getString(14));
				   st.setParents_addr(rs.getString(15));
				   st.setEmergency_contact(rs.getString(16));
				   st.setUniversit(rs.getString(17));
				   st.setProfiles(rs.getString(18));
				   st.setClass_Id(rs.getInt(19));
			   }
		   }catch(Exception e){
			   System.out.println(e.getMessage());
		   }finally{
			   try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
		   return st;
	}
	public boolean changeStudentStatus(String id,int status){
		Connection con=DBConnection.getConnect();
		try{
			con.setAutoCommit(false);
			PreparedStatement change=con.prepareStatement(" UPDATE tbl_students SET status=? WHERE stu_id=?");
			change.setInt(1,status);
			change.setString(2, id);
			if(change.executeUpdate()>0){
				con.commit();
				return true;
			}else{
				con.rollback();
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return false;
	}
	public static void main(String[] args) {
		/*Student student=new Student();
		student.setFname("Chan");
		student.setLname("Danary");
		student.setGender("M");
		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date("10/10/2009");
		java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
		student.setDob(sqlDate);
		student.setPob("Prey Veng");
		student.setPaddr("Phnom Penh");
		student.setPhone("0712354");
		student.setEmail("dana@gmail.com");
		student.setFa_name("Chetra");
		student.setFa_phone("0124575");
		student.setMo_name("Meta");
		student.setMo_phone("014575475");
		student.setParents_addr("Phnom penh");
		student.setEmergency_contact("01745665");
		student.setStu_id("stu010");
		System.out.print(updateStudentInfo(student));*/
		try {
			System.out.print(new StudentDAO().insertStutoNoti("ST0004"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
