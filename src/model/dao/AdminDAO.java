package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.Attendent;
import model.dto.AttendentSelection;
import model.dto.Room;
import model.dto.Score;
import model.dto.Student;
import model.dto.StudentScore;
import model.dto.Subject;
import model.dto.UserInfo;
import Utility.DBConnection;

public class AdminDAO {

	public AdminDAO() {
		System.out.println("Connecting to database...");
	}
	//get username and image to jstl
	public static ArrayList<Object> checkLogin(String name,String pass) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT staff_id,username,usersrc,position FROM tbl_staffs"
				+ " WHERE (LOWER(username)=? or email=?) and pwd=? AND status=1");
		ps.setString(1, name.toLowerCase());
		ps.setString(2, name);
		ps.setString(3, pass);
	
		ResultSet rs = ps.executeQuery();
		ArrayList<Object> adminlogin=new ArrayList<Object>();
		try{
			while(rs.next()){
				adminlogin.add(rs.getString(1));
				adminlogin.add(rs.getString(2));
				adminlogin.add(rs.getString(3));
				adminlogin.add(rs.getString(4));
				return adminlogin;
			}
				
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return null;
	}
	//refreshing session
		public static ArrayList<Object> refreshSession(String adminid) throws SQLException{
				Connection con=DBConnection.getConnect();
				PreparedStatement ps = con.prepareStatement("SELECT staff_id,username,usersrc,position FROM tbl_staffs "
						+ "WHERE staff_id=? ");
				ps.setString(1, adminid);
				ResultSet rs = ps.executeQuery();
				ArrayList<Object> adminlogin=new ArrayList<Object>();
				try{
					while(rs.next()){
						adminlogin.add(rs.getString(1));
						adminlogin.add(rs.getString(2));
						adminlogin.add(rs.getString(3));
						adminlogin.add(rs.getString(4));
						return adminlogin;
					}
						
				}finally{
					if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
					if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
					if(con!=null)try{con.close();}catch(SQLException e){throw e;}
				}
				return null;
	}
		
	//user setting
	public static UserInfo getAdminUser(String adminid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT username,pwd,email,usersrc,bgsrc FROM tbl_staffs WHERE staff_id=?");
		ps.setString(1, adminid);
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
	public static boolean checkPassword(String adminid,String password) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT pwd FROM tbl_staffs WHERE staff_id=? ");
		ps.setString(1, adminid);
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
	//updating
	public static boolean updateImageUser(String adminid,String imguser) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("UPDATE  tbl_staffs SET usersrc=? WHERE staff_id=? ");
		ps.setString(1, imguser);
		ps.setString(2, adminid);
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
			
		return false;
	}
		public static boolean updatePassword(String adminid,String Password) throws SQLException{
			Connection con=DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("UPDATE  tbl_staffs SET pwd=? WHERE staff_id=? ");
			ps.setString(1, Password);
			ps.setString(2, adminid);
			if(ps.executeUpdate()>0){
				if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
				if(con!=null)try{con.close();}catch(SQLException e){throw e;}
				return true;
			}
				
			return false;
		}
		public static boolean updateUserInfo(UserInfo user) throws SQLException{
			Connection con=DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("UPDATE  tbl_staffs SET username=? WHERE staff_id=? ");
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getUserid());
			if(ps.executeUpdate()>0){
				if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
				if(con!=null)try{con.close();}catch(SQLException e){throw e;}
				return true;
			}
				
			return false;
			
		}
		public static boolean updateBackgroundUser(String adminid,String bguser) throws SQLException{
			Connection con=DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("UPDATE  tbl_staffs SET bgsrc=? WHERE staff_id=? ");
			ps.setString(1, bguser);
			ps.setString(2, adminid);
			if(ps.executeUpdate()>0){
				if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
				if(con!=null)try{con.close();}catch(SQLException e){throw e;}
				return true;
			}
				
			return false;
		}
		
		//close updating
	//end user setting
	//score management page
	public static ArrayList<Subject> getSubjectScore(String adminid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT DISTINCT sub.subject_id,sub.subject_name "
				+ "FROM tbl_subjects sub INNER JOIN tbl_subjectselection sele "
				+ "ON sub.subject_id=sele.subject_id INNER JOIN tbl_staffs stf "
				+ "ON stf.staff_id=sele.staff_id "
				+ "WHERE stf.staff_id like ?");
		ps.setString(1, adminid+"%");
		ResultSet rs = ps.executeQuery();
		ArrayList<Subject> subjects=new ArrayList<Subject>();
		try{
			while(rs.next()){
				Subject subject=new Subject();
				subject.setSubject_id(rs.getString(1));
				subject.setSubject_name(rs.getString(2));
				subjects.add(subject);
			}
			return subjects;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		
	}
	public static ArrayList<Room> getClassScore(String adminid,String subjectid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT DISTINCT cls.class_id,cls.class_name,cour.course_type,g.generation"
				+ "	FROM tbl_class cls LEFT JOIN tbl_course cour "
				+ "ON cour.course_id=cls.course_id LEFT JOIN tbl_generation g "
				+ "ON g.g_id=cour.g_id "
				+ "LEFT JOIN tbl_subjectselection selects "
				+ "ON selects.class_id=cls.class_id LEFT JOIN tbl_subjects sub  "
				+ "ON sub.subject_id=selects.subject_id LEFT JOIN tbl_staffs stao "
				+ "ON stao.staff_id=selects.staff_id "
				+ "WHERE sub.subject_id=? and stao.staff_id like ?");
		ps.setString(1, subjectid);
		ps.setString(2, adminid+"%");
		ResultSet rs = ps.executeQuery();
		ArrayList<Room> rooms=new ArrayList<Room>();
		try{
			while(rs.next()){
				Room room=new Room();
				room.setId(rs.getInt(1));
				room.setName(rs.getString(2));
				room.setCourse_name(rs.getString(3));
				room.setGeneration(rs.getString(4));
				rooms.add(room);
			}
			return rooms;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
	}
	public static boolean addStudentScore(Score score){
		Connection con=DBConnection.getConnect();
		try {
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement("INSERT INTO tbl_score(score_month,score,subject_id,student_id,staff_id) VALUES(?,?,?,?,?)");
			ps.setString(1, score.getMonth());
			ps.setFloat(2, score.getScore());
			ps.setString(3,score.getSubj_id());
			ps.setString(4, score.getStu_id());
			ps.setString(5, score.getStaff_id());
			if (ps.executeUpdate()>0) {
				con.commit();
				return true;
			} else {
				con.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	public static boolean updateStudentScore(Score score){
		Connection con=DBConnection.getConnect();
		try {
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement("UPDATE tbl_score SET score=?,staff_id=? "
					+ "WHERE score_id=?");
			ps.setFloat(1, score.getScore());
			ps.setString(2, score.getStaff_id());
			ps.setInt(3, score.getId());
			
			if (ps.executeUpdate()>0) {
				con.commit();
				return true;
			} else {
				con.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	public static ArrayList<StudentScore> getScoreListStudent(String month,String subject,int stuclass) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT stu.stu_id,CONCAT(stu.last_name,' ',stu.first_name),s.score,stf.stf_name,stf.position,s.score_id from tbl_students stu "
				+ "LEFT  JOIN tbl_score s  ON s.student_id=stu.stu_id  "
				+ "LEFT OUTER JOIN tbl_selection seal  "
				+ "ON seal.stu_id=stu.stu_id LEFT OUTER JOIN tbl_class cls  "
				+ "ON cls.class_id=seal.class_id lEFT OUTER JOIN tbl_course cour "
				+ "ON cour.course_id=cls.course_id LEFT OUTER JOIN tbl_generation g "
				+ "ON g.g_id = cour.g_id LEFT OUTER JOIN tbl_subjects subj "
				+ "ON subj.subject_id=s.subject_id LEFT OUTER JOIN tbl_staffs stf "
				+ "ON stf.staff_id=s.staff_id "
				+ "WHERE s.score_month=? and subj.subject_id=? and cls.class_id=?  ORDER BY s.score");
		ps.setString(1, month);
		ps.setString(2, subject);
		ps.setInt(3, stuclass);
		ResultSet rs = ps.executeQuery();
		ArrayList<StudentScore> stuscores=new ArrayList<StudentScore>();
		try{
			while(rs.next()){
				StudentScore stuscore=new StudentScore();
			
				stuscore.setStu_id(rs.getString(1));
				stuscore.setStu_name(rs.getString(2));
				stuscore.setStu_score(rs.getFloat(3));
				stuscore.setStaff_name(rs.getString(4));
				stuscore.setStaff_position(rs.getString(5));
				stuscore.setScore_id(rs.getInt(6));
				stuscores.add(stuscore);
			}
			return stuscores;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
	}
	public static ArrayList<StudentScore> getNoScoreListStudent(String month,String subject,int stuclass) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT student.stu_id,CONCAT(student.last_name,' ',student.first_name) from tbl_students student "
				+ "LEFT JOIN tbl_selection se ON se.stu_id = student.stu_id  "
				+ "LEFT JOIN tbl_class tcls ON tcls.class_id=se.class_id "
				+ "WHERE tcls.class_id=? and student.stu_id  NOT IN (SELECT stu.stu_id from tbl_students stu "
				+ "LEFT  JOIN tbl_score s  ON s.student_id=stu.stu_id  LEFT OUTER JOIN tbl_selection seal  "
				+ "ON seal.stu_id=stu.stu_id LEFT OUTER JOIN tbl_class cls	"
				+ "ON cls.class_id=seal.class_id lEFT OUTER JOIN tbl_course cour "
				+ "ON cour.course_id=cls.course_id LEFT OUTER JOIN tbl_generation g "
				+ "ON g.g_id = cour.g_id LEFT OUTER JOIN tbl_subjects subj "
				+ "ON subj.subject_id=s.subject_id "
				+ "WHERE s.score_month=? and subj.subject_id=?  and cls.class_id=?) ORDER BY student.stu_id");
		ps.setInt(1, stuclass);
		ps.setString(2, month);
		ps.setString(3, subject);
		ps.setInt(4, stuclass);
		ResultSet rs = ps.executeQuery();
		ArrayList<StudentScore> stuscores=new ArrayList<StudentScore>();
		try{
			while(rs.next()){
				StudentScore stuscore=new StudentScore();
				stuscore.setStu_id(rs.getString(1));
				stuscore.setStu_name(rs.getString(2));
				stuscores.add(stuscore);
			}
			return stuscores;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
	}
	public static float getScorePercent(String subject) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT sub.score_percent  FROM tbl_subjects sub WHERE sub.subject_id=?");
		ps.setString(1, subject);
		ResultSet rs = ps.executeQuery();
		
		try{
			while(rs.next()){
				return rs.getFloat(1);
			}
		
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return 0;
	}
	public static float getSubjectPercent(String subjectid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT score_percent FROM tbl_subjects WHERE subject_id=?");
		ps.setString(1, subjectid);
		ResultSet rs = ps.executeQuery();
		
		try{
			while(rs.next()){
				return rs.getFloat(1);
			}
		
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return 0;
				
	}
	//end score management page
	//add attendance
	public ArrayList<Student> selectAllStudents(){
		Connection con=DBConnection.getConnect();
		ArrayList<Student> students = new ArrayList<Student>();
		try {
			con.setAutoCommit(false);
			CallableStatement cs = con.prepareCall("{CALL select_allstudentsf()}");
			cs.execute();
			ResultSet rs = cs.getResultSet();
			while(rs.next()){
				Student student = new Student();
				student.setStu_id(rs.getString(1));
				student.setFname(rs.getString(2));
				student.setLname(rs.getString(3));
				students.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return students;
	}
	public boolean addAttendance_permission(Attendent attn) throws SQLException{
		Connection con=DBConnection.getConnect();
		String sql = "{CALL addattendance_permission(?,?,?)}";
		con.setAutoCommit(false);
		CallableStatement cs = con.prepareCall(sql);
		try {
			
			cs.setDate(1,new java.sql.Date(attn.getAt_date().getTime()));
			cs.setString(2,attn.getStu_id());
			cs.setInt(3, attn.getPermission());
			if(cs.execute()){
				con.commit();
				return true;
			}else{
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			if(cs!=null)try{cs.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return false;
	}
	
	public boolean addAttendance_absence(Attendent attn) throws SQLException{
		Connection con=DBConnection.getConnect();
		String sql = "{CALL addattendance_absence(?,?,?)}";
		
		try {
			con.setAutoCommit(false);
			CallableStatement cs = con.prepareCall(sql);
			cs.setDate(1,new java.sql.Date(attn.getAt_date().getTime()));
			cs.setString(2,attn.getStu_id());
			cs.setInt(3, attn.getAbsent());
			if(cs.execute()){
				con.commit();
				return true;
			}else{
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return false;
	}
	
	public boolean addAttendance_late(Attendent attn){
		Connection con=DBConnection.getConnect();
		String sql = "{CALL addattendance_late(?,?,?)}";
		try {
			con.setAutoCommit(false);
			CallableStatement cs = con.prepareCall(sql);
			cs.setDate(1,new java.sql.Date(attn.getAt_date().getTime()));
			cs.setString(2,attn.getStu_id());
			cs.setInt(3, attn.getLate());
			if(cs.execute()){
				con.commit();
				return true;
			}else{
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return false;
	} 
	public ArrayList<Attendent> select_attendancelist(Date date){
		Connection con=DBConnection.getConnect();
		ArrayList<Attendent> attn = new ArrayList<Attendent>();
		try {
			con.setAutoCommit(false);
			String sql = "{CALL select_attendancelistf(?)}";
			CallableStatement cs = con.prepareCall(sql);
			cs.setDate(1, date);
			cs.execute();
			ResultSet rs = cs.getResultSet();
			Attendent att=null;
			while(rs.next()){
				att=new Attendent();
				att.setId(rs.getInt(1));
				att.setStudent_name(rs.getString(2));
				att.setAt_date(rs.getDate(3));
				att.setAbsent(rs.getInt(4));
				att.setPermission(rs.getInt(5));
				att.setLate(rs.getInt(6));
				attn.add(att);
			}
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return attn;
	}
	public ArrayList<Attendent> listAttendanceStudent(Date startdate,Date todate){
		Connection con=DBConnection.getConnect();
		ArrayList<Attendent> attn = new ArrayList<Attendent>();
		try {
			con.setAutoCommit(false);
			String sql = "{CALL get_student_attendent(?,?)}";
			CallableStatement cs = con.prepareCall(sql);
			cs.setDate(1, startdate);
			cs.setDate(2, todate);
			cs.execute();
			ResultSet rs = cs.getResultSet();
			Attendent att=null;
			while(rs.next()){
				att=new Attendent();
				att.setStu_id(rs.getString(1));
				att.setProfilesrc(rs.getString(2));
				att.setStudent_name(rs.getString(3));
				att.setStudentgeneder(rs.getString(4));
				att.setClass_name(rs.getString(5));
				att.setDescription(rs.getString(6));
				att.setAbsent(rs.getInt(7));
				att.setPermission(rs.getInt(8));
				att.setLate(rs.getInt(9));
				attn.add(att);
			}
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return attn;
	}
	public ArrayList<Attendent> listAttendanceDetail(String month,String year){
		Connection con=DBConnection.getConnect();
		ArrayList<Attendent> attn = new ArrayList<Attendent>();
		try {
			con.setAutoCommit(false);
			String sql = "SELECT stu_id,profilesrc,name,gender,cls_name,'Test'::TEXT || ' to ' || 'Test'::TEXT,sum(absent)::int,sum(permission)::int,sum(late)::int "
					+ "FROM v_student_attendent WHERE date_part('Month',date)::INT::TEXT = ? AND "
					+ "date_part('Year',date)::INT::TEXT =? GROUP BY stu_id,cls_name,name,gender,profilesrc";
			PreparedStatement cs = con.prepareStatement(sql);
			cs.setString(1, month);
			cs.setString(2, year);
			cs.executeQuery();
			ResultSet rs = cs.getResultSet();
			Attendent att=null;
			while(rs.next()){
				att=new Attendent();
				att.setStu_id(rs.getString(1));
				att.setProfilesrc(rs.getString(2));
				att.setStudent_name(rs.getString(3));
				att.setStudentgeneder(rs.getString(4));
				att.setClass_name(rs.getString(5));
				att.setDescription(rs.getString(6));
				att.setAbsent(rs.getInt(7));
				att.setPermission(rs.getInt(8));
				att.setLate(rs.getInt(9));
				attn.add(att);
			}
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return attn;
	}
	public static boolean checkAddScore(Score score){
		Connection con=DBConnection.getConnect();

		try{
			PreparedStatement ps = con.prepareStatement("SELECT score_id FROM tbl_score WHERE  subject_id=? and score_month=? and student_id=?");
			ps.setString(1, score.getSubj_id());
			ps.setString(2, score.getMonth());
			ps.setString(3, score.getStu_id());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				System.out.print("have records");
				/*if(subject.equals(rs.getString(1))  && classid==rs.getInt(2) && instructor.equals(rs.getString(3))){
					status=false;
				}else{
					status=true;
				}*/
				return false;
			}
			System.out.print("no records");
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	public ArrayList<Attendent> listSpecificAttendanceStudent(String stuid,Date startdate,Date todate){
		Connection con=DBConnection.getConnect();
		ArrayList<Attendent> attn = new ArrayList<Attendent>();
		try {
			con.setAutoCommit(false);
			String sql = "SELECT "
					+ "stu.stu_id"
					+ ",stu.profilesrc"
					+ ",stu.last_name || '  '|| stu.first_name as Name"
					+ ",stu.gender"
					+ ",cls.class_name as Cls_Name"
					+ ",att.att_date AS date"
					+ ",sum(permission) as Permission"
					+ ",sum(absence) As Absent"
					+ ",sum(late) AS Late "
					+ "FROM tbl_attendance att RIGHT JOIN tbl_students stu "
					+ "INNER JOIN tbl_selection sls ON stu.stu_id=sls.stu_id "
					+ "INNER JOIN tbl_class cls ON sls.class_id=cls.class_id "
					+ "ON att.stu_id=stu.stu_id "
					+ "WHERE stu.status=1 and stu.stu_id=?"
					+ " AND att.att_date BETWEEN ? AND ?  "
					+ "GROUP BY stu.stu_id,att.att_date,cls.class_name "
					+ "ORDER BY att.att_date DESC";
			CallableStatement cs = con.prepareCall(sql);
			cs.setString(1, stuid);
			cs.setDate(2, startdate);
			cs.setDate(3, todate);
			cs.execute();
			ResultSet rs = cs.getResultSet();
			Attendent att=null;
			while(rs.next()){
				att=new Attendent();
				att.setStu_id(rs.getString(1));
				att.setProfilesrc(rs.getString(2));
				att.setStudent_name(rs.getString(3));
				att.setStudentgeneder(rs.getString(4));
				att.setClass_name(rs.getString(5));
				att.setAt_date(rs.getDate(6));
				att.setPermission(rs.getInt(7));
				att.setAbsent(rs.getInt(8));
				att.setLate(rs.getInt(9));
				attn.add(att);
			}
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return attn;
	}
	public ArrayList<AttendentSelection> select_attendenceStu(){
		Connection con=DBConnection.getConnect();
		ArrayList<AttendentSelection> attn = new ArrayList<AttendentSelection>();
		try {
			String sql = "{CALL select_attendancef()}";
			CallableStatement cs = con.prepareCall(sql);
			cs.execute();
			ResultSet rs = cs.getResultSet();
			AttendentSelection ats = null;
			while(rs.next()){
				
				ats=new AttendentSelection();
				ats.setTitle(rs.getString(1));
				ats.setStart(rs.getDate(2));
				ats.setAtt_id(rs.getInt(6));
				ats.setAbsence(rs.getInt(3));
				ats.setPermission(rs.getInt(4));
				ats.setLate(rs.getInt(5));
				attn.add(ats);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return attn;
	}
	public boolean delete_attendance(int att_id){
		Connection con=DBConnection.getConnect();
		try {
			con.setAutoCommit(false);
			CallableStatement cs = con.prepareCall("{CALL delete_attendance(?)}");
			cs.setInt(1, att_id);
			if(cs.execute()){
				con.commit();
				return true;
			}else{
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				con.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public static void main(String[] args) {
		/*Score score=new Score();
		score.setMonth("6");
		score.setScore(30);
		score.setSubj_id("sub001");
		score.setStu_id("stu001");
		score.setStaff_id("st001");
		
		System.out.print(addStudentScore(score));*/
		
		/*@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date( "2015/05/34");
		java.sql.Date sdate = new java.sql.Date(myDate.getTime());
		@SuppressWarnings("deprecation")
		java.util.Date myDate1 = new java.util.Date( "2020/05/31");
		java.sql.Date tdate = new java.sql.Date(myDate1.getTime());
		//System.out.println(new AdminDAO().listAttendanceStudent(sdate,tdate));*/
		//System.out.println(new AdminDAO().listSpecificAttendanceStudent("ST0001",sdate, tdate));
		System.out.println(new AdminDAO().select_attendenceStu());
		
	}

}
