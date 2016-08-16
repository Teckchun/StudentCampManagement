package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Utility.DBConnection;
import model.dto.Generation;
import model.dto.Room;
import model.dto.Score;
import model.dto.Staff;
import model.dto.Subject;
import model.dto.SubjectSelection;
import model.dto.UserInfo;

public class SubjectDAO {
	public SubjectDAO(){
		System.out.println("Connecting to database...");
	}
	public static ArrayList<Subject> getActiveSubject() throws SQLException{
		
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT subject_id,subject_name FROM tbl_subjects WHERE status=1");	
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
	
public static ArrayList<Room> getActiveClass() throws SQLException{
		
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT cls.class_id,cls.class_name,cou.course_type,g.generation "
				+ "FROM tbl_class cls LEFT JOIN tbl_course cou   "
				+ "ON cls.course_id=cou.course_id LEFT JOIN tbl_generation g "
				+ "ON g.g_id=cou.g_id "
				+ "WHERE cls.status=1");	
		ResultSet rs = ps.executeQuery();
		ArrayList<Room> classes=new ArrayList<Room>();
		try{
			while(rs.next()){
				Room classroom=new Room();
				classroom.setId(rs.getInt(1));
				classroom.setName(rs.getString(2));
				classroom.setCourse_name(rs.getString(3));
				classroom.setGeneration(rs.getString(4));
				classes.add(classroom);
			}
			
			return classes;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
	}
public static ArrayList<Staff> getActiveInstructor() throws SQLException{
	
	Connection con=DBConnection.getConnect();
	PreparedStatement ps = con.prepareStatement("SELECT staf.staff_id,staf.stf_name "
			+ "FROM tbl_staffs staf  "
			+ "WHERE staf.status=1 and position='teacher'"
			+ "ORDER BY staf.stf_name");	
	ResultSet rs = ps.executeQuery();
	ArrayList<Staff> staffs=new ArrayList<Staff>();
	try{
		while(rs.next()){
			Staff staff=new Staff();
			staff.setId(rs.getString(1));
			staff.setName(rs.getString(2));
			staffs.add(staff);
		}
		
		return staffs;
		
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
		if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
		if(con!=null)try{con.close();}catch(SQLException e){throw e;}
	}
}
	
	public static ArrayList<SubjectSelection> listSubjectSelection() throws SQLException{

		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT subjs.subselect_id,subject.subject_name,cls.class_name,cour.course_type,g.generation,staff.stf_name,subjs.create_date,subject.status "
				+ "FROM tbl_subjects subject INNER JOIN tbl_subjectselection subjs "
				+ "ON subjs.subject_id=subject.subject_id INNER JOIN tbl_class cls "
				+ "ON cls.class_id=subjs.class_id INNER JOIN tbl_course cour "
				+ "ON cour.course_id=cls.course_id INNER JOIn tbl_generation g "
				+ "ON g.g_id=cour.g_id INNER JOIN tbl_staffs staff  "
				+ "ON staff.staff_id=subjs.staff_id "
				+ "ORDER BY subjs.create_date DESC");	
		ResultSet rs = ps.executeQuery();
		ArrayList<SubjectSelection> subjects=new ArrayList<SubjectSelection>();
		try{
			while(rs.next()){
				SubjectSelection subject=new SubjectSelection();
				subject.setId(rs.getInt(1));
				subject.setName(rs.getString(2));
				subject.setClass_name(rs.getString(3));
				subject.setCourse(rs.getString(4));
				subject.setGeneration(rs.getString(5));
				subject.setStaff_name(rs.getString(6));
				subject.setC_date(rs.getDate(7));
				subject.setSubject_status(rs.getInt(8));
				subjects.add(subject);
			}
			
			return subjects;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
	}
	public static boolean insertSubjectSelection(String subject,int classid,String instructor){
		Connection con=DBConnection.getConnect();
	
		try{
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement("INSERT INTO tbl_subjectselection(subject_id,class_id,staff_id) VALUES(?,?,?)");	
			ps.setString(1, subject);
			ps.setInt(2, classid );
			ps.setString(3, instructor);
			
			if(ps.executeUpdate()>0){
				con.commit();
				return true;
			}
			else{
				con.rollback();
			}
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
		return false;
	}
	public static boolean checkSubjectSelection(String subject,int classid,String instructor){
		Connection con=DBConnection.getConnect();

		try{
			PreparedStatement ps = con.prepareStatement("SELECT subject_id FROM tbl_subjectselection WHERE  subject_id=? and class_id=? and staff_id=?");
			ps.setString(1, subject);
			ps.setInt(2, classid);
			ps.setString(3, instructor);
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
	
	public static SubjectSelection getSubjectSelection(int subselectid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT subject_id,class_id,staff_id FROM tbl_subjectselection WHERE subselect_id=?");
		ps.setInt(1, subselectid);
		ResultSet rs = ps.executeQuery();
		SubjectSelection subselect=new SubjectSelection();
		try{
			while(rs.next()){
				
				subselect.setSub_id(rs.getString(1));
				subselect.setClass_id(rs.getInt(2));
				subselect.setStaff_id(rs.getString(3));
				return subselect;
			}
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
		return null;
	}
	public static boolean updateSubSelection(String subjectid,int classid,String staffid,int subselectid) throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("UPDATE tbl_subjectselection SET subject_id=?,class_id=?,staff_id=? WHERE subselect_id=?");
		
		ps.setString(1, subjectid);
		ps.setInt(2, classid);
		ps.setString(3, staffid);
		ps.setInt(4,subselectid);
	
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
		return false;
	}
	
	//subject page
	public static ArrayList<Subject> listSubject() throws SQLException{
		Connection con=DBConnection.getConnect();
		PreparedStatement ps = con.prepareStatement("SELECT * from tbl_subjects");	
		ResultSet rs = ps.executeQuery();
		ArrayList<Subject> subjects=new ArrayList<Subject>();
		try{
			while(rs.next()){
				Subject subject=new Subject();
				subject.setSubject_id(rs.getString(1));
				subject.setSubject_name(rs.getString(2));
				subject.setCreat_date(rs.getDate(3));
				subject.setSub_percent(rs.getFloat(4));
				subject.setDescription(rs.getString(5));
				subject.setStatus(rs.getInt(6));
				subjects.add(subject);
			}
			
			return subjects;
			
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){throw e;}
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
		}
	}
	
	public boolean addSubject(Subject sub){
		Connection con=DBConnection.getConnect();
		
		try{
			con.setAutoCommit(false);
			PreparedStatement ps = con.prepareStatement("INSERT INTO tbl_subjects(subject_id,subject_name,creat_date,score_percent,description) VALUES(?,?,?,?,?)");	
			ps.setString(1,  getAutoId());
			ps.setString(2, sub.getSubject_name() );
			ps.setDate(3, sub.getCreat_date());
			ps.setFloat(4, sub.getSub_percent());
			ps.setString(5, sub.getDescription());
			
			if(ps.executeUpdate()>0){
				con.commit();
				return true;
			}
			else{
				con.rollback();
			}
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
		return false;
	}
	public static Subject getEditSubject(String subjectid){
		Connection con=DBConnection.getConnect();
		Subject subject=null;
		try{
			CallableStatement ps=con.prepareCall("{call get_1subject_info(?)}");
			ps.setString(1,subjectid);
			ps.execute();
			ResultSet rs=ps.getResultSet();
		    if(rs.next()){
		 
		    	subject=new Subject();
		    	subject.setSubject_name(rs.getString(2));
		    	subject.setCreat_date(rs.getDate(3));
		    	subject.setDescription(rs.getString(4));
		    	subject.setSub_percent(rs.getFloat(5));
		    	
		    	
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
		return subject;
	}
	
	public static boolean updateSubject(Subject sub) throws SQLException{
		Connection con=DBConnection.getConnect();
	    PreparedStatement ps = con.prepareStatement("UPDATE tbl_subjects SET subject_name=?,creat_date=?,description=?,score_percent=? WHERE subject_id=?");
		
		ps.setString(1, sub.getSubject_name());
		ps.setDate(2, sub.getCreat_date());
		ps.setString(3, sub.getDescription());
		ps.setFloat(4, sub.getSub_percent());
		ps.setString(5,sub.getSubject_id());
	
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
		return false;
	}
	public static boolean deleteSelectSubject(int subselectid) throws SQLException{
		Connection con=DBConnection.getConnect();
	    PreparedStatement ps = con.prepareStatement("DELETE FROM tbl_subjectselection WHERE subselect_id=?");
	    ps.setInt(1,subselectid);
	
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
		return false;
	}
	public static boolean updateSubjectStatus(String id,int status) throws SQLException{
		Connection con=DBConnection.getConnect();
	    PreparedStatement ps = con.prepareStatement("UPDATE tbl_subjects SET status=? WHERE subject_id=?");
		
		
		ps.setInt(1, status);
		ps.setString(2, id);
	
		if(ps.executeUpdate()>0){
			if(ps!=null)try{ps.close();}catch(SQLException e){throw e;}
			if(con!=null)try{con.close();}catch(SQLException e){throw e;}
			return true;
		}
		return false;
	}
	
	public  String getAutoId() {
		Connection con=DBConnection.getConnect();
		int row = new SubjectDAO().getNumberofRow();
		String stid = "";
		try {
			CallableStatement getid = con.prepareCall("{call get_max_subject_id()}");
			getid.execute();
			ResultSet rs = getid.getResultSet();
			if (rs.next() && row != 0) {
				String ids = rs.getString(1).substring(3).trim();
				int back = Integer.parseInt(ids);
				if (back < 9) {
					back += 1;
					stid = "SUB00" + back;
				} else if(back<99) {
					back += 1;
					stid = "SUB0" + back;
				}
				else if(back<998) {
					back += 1;
					stid = "SUB" + back;
				}
			} else {
				stid = "SUB001";
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

	public  int getNumberofRow() {
		int row = 0;
		Connection con=DBConnection.getConnect();
		try {
			CallableStatement number = con.prepareCall("{call get_num_of_row_subject_table()}");
			number.execute();
			ResultSet rs = number.getResultSet();
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
	public static void main(String[] args) {
		
			try {
				System.out.print(SubjectDAO.getActiveInstructor());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	
}
