package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Utility.DBConnection;
import model.dto.Course;
import model.dto.Generation;

public class CourseDAO {
	private Connection con;

	public CourseDAO() {
		con = DBConnection.getConnect();
	}

	public boolean addCourse(Course cs) {
		try {
			con.setAutoCommit(false);
			CallableStatement insert = con.prepareCall("{call add_course(?,?,?,?,?)}");
			insert.setString(1, cs.getCourse_type());
			insert.setDate(2, new java.sql.Date(cs.getStartdate().getTime()));
			insert.setDate(3, new java.sql.Date(cs.getEnddate().getTime()));
			insert.setInt(4, cs.getG_id());
			insert.setString(5, cs.getDescription());
			if (insert.execute()) {
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

	public boolean updateCourse(Course cs) {
		try {
			con.setAutoCommit(false);
			CallableStatement update = con.prepareCall("{call update_course(?,?,?,?,?,?)}");
			update.setInt(1, cs.getId());
			update.setString(2, cs.getCourse_type());
			update.setDate(3, new java.sql.Date(cs.getStartdate().getTime()));
			update.setDate(4, new java.sql.Date(cs.getEnddate().getTime()));
			update.setInt(5, cs.getG_id());
			update.setString(6, cs.getDescription());
			if (update.execute()) {
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

	public ArrayList<Course> getAllCourse() {
		ArrayList<Course> courses = new ArrayList<Course>();
		try {
			Course cs = null;
			CallableStatement getcourse = con.prepareCall("{call get_all_cousre()}");
			getcourse.execute();
			ResultSet rs = getcourse.getResultSet();
			while (rs.next()) {
				cs = new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getDate(5),
						rs.getInt(6),rs.getInt(7));
				courses.add(cs);
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
		return courses;
	}
	public ArrayList<Course> getCourseCombo(String gen) {
		ArrayList<Course> courses = new ArrayList<Course>();
		try {
			
			PreparedStatement ps = con.prepareStatement("SELECT cou.course_id,cou.course_type,g.generation FROM tbl_course cou"
					+ " LEFT JOIN tbl_generation g ON g.g_id=cou.g_id "
					+ "WHERE g.generation LIKE ? "
					+ "ORDER BY course_id");
			ps.setString(1,gen+"%");
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			while (rs.next()) {
				Course course=new Course();
				course.setId(rs.getInt(1));
				course.setCourse_type(rs.getString(2));
				course.setG_name(rs.getString(3));
				courses.add(course);
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
		return courses;
	}

	public boolean changeStatus(int id, int status) {
		try {
			con.setAutoCommit(false);
			PreparedStatement changestat = con.prepareStatement("  UPDATE tbl_course SET status=? WHERE course_id=?; "
					+ " UPDATE tbl_class SET status=? WHERE course_id=?;");
			changestat.setInt(1, status);
			changestat.setInt(2, id);
			changestat.setInt(3, status);
			changestat.setInt(4, id);
			if (changestat.executeUpdate()>0) {
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
	public Course getCourse(int id){
		Course cou=null;
		try{
			CallableStatement getgn=con.prepareCall("{call get_1course_info(?)}");
			getgn.setInt(1,id);
			getgn.execute();
			ResultSet rs=getgn.getResultSet();
		    if(rs.next()){
		    	cou=new Course();
		    	cou.setId(rs.getInt(1));
		    	cou.setCourse_type(rs.getString(2));
		    	cou.setG_id(rs.getInt(3));
		    	cou.setG_name(rs.getString(4));
		    	cou.setStartdate(rs.getDate(5));
		    	cou.setEnddate(rs.getDate(6));
		    	cou.setDescription(rs.getString(7));
		    	
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
		return cou;
	}
	public ArrayList<Course> listCourseType() {
		ArrayList<Course> coursetype = new ArrayList<Course>();
		try {
			CallableStatement getcoursetype = con.prepareCall("{call list_course_type()}");
			getcoursetype.execute();
			Course crs=null;
			ResultSet rs = getcoursetype.getResultSet();
			while (rs.next()) {
				crs=new Course();
				crs.setId(rs.getInt(1));
				crs.setCourse_type(rs.getString(2));
				crs.setG_name(rs.getString(3));
				coursetype.add(crs);
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
		return coursetype;
	} 
	public static void main(String[] args) {
		/*
		 * int id=new CourseDAO().getGenerationId("2nd Generation"); Course
		 * co=new Course("Basic","For 2nd Generation",new Date("2014/04/01"),new
		 * Date("2014/08/01"),id); new CourseDAO().addCourse(co);
		 */
		// ArrayList<Course> courses=new CourseDAO().getAllCourse();
		// for(Course cs:courses){
		// System.out.println(cs.toString());
		// }
		// new CourseDAO().changeStatus(1,0);
//		 ArrayList<String> coursetype=new CourseDAO().listCourseType();
//		 for(String c:coursetype){
//		 System.out.println(c);
//		 }
		ArrayList<Course> coursetype=new CourseDAO().listCourseType();
		System.out.println(coursetype);
	//System.out.print(new CourseDAO().getCourseCombo(""));
	}

}
