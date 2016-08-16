package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controller.admin.classroom.GetStudentInRoom;
import Utility.DBConnection;
import model.dto.Room;
import model.dto.Student;

public class RoomDAO {
	private Connection con;

	public RoomDAO() {
		con = DBConnection.getConnect();
	}

	public boolean addClass(Room r) {
		try {
			con.setAutoCommit(false);
			CallableStatement insert = con.prepareCall("{call add_class(?,?,?,?)}");
			insert.setString(1, r.getName());
			insert.setString(2, r.getColor());
			insert.setInt(3, r.getCourse_id());
			insert.setString(4, r.getDescription());
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
				e.printStackTrace();
			}
		}
		return false;
	}

	public ArrayList<Room> getNumberStudentInClass(String generation,String course,String status) {
		ArrayList<Room> nsc = new ArrayList<Room>();
		try {
			CallableStatement getnumstudentinclass = con.prepareCall("{call get_number_student_in_class(?,?,?)}");
			getnumstudentinclass.setString(1, generation+"%");
			getnumstudentinclass.setString(2, course+"%");
			getnumstudentinclass.setString(3, status+"%");
			getnumstudentinclass.execute();
			ResultSet rs = getnumstudentinclass.getResultSet();
			Room room = null;
			while (rs.next()) {
				room = new Room();
				room.setId(rs.getInt(1));
				room.setName(rs.getString(2));
				room.setTotal_studen(rs.getInt(3));
				room.setColor(rs.getString(4));
				room.setCourse_name(rs.getString(5));
				room.setGeneration(rs.getString(6));
				room.setStaus(rs.getInt(7));
				nsc.add(room);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nsc;
	}
	public ArrayList<Room> getClassCombo(String course,String gen) {
		ArrayList<Room> nsc = new ArrayList<Room>();
		try {
			PreparedStatement ps=con.prepareStatement("SELECT cls.class_id,cls.class_name,cou.course_type,g.generation  "
					+ "FROM tbl_class cls LEFT JOIN tbl_course cou "
					+ "ON cou.course_id=cls.course_id "
					+ "LEFT JOIN tbl_generation g ON g.g_id=cou.g_id "
					+ "WHERE cou.course_type LIKE ? and g.generation LIKE ?");
			ps.setString(1, course+"%");
			ps.setString(2, gen+"%");
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			Room room = null;
			while (rs.next()) {
				room = new Room();
				room.setId(rs.getInt(1));
				room.setName(rs.getString(2));
				room.setCourse_name(rs.getString(3));
				room.setGeneration(rs.getString(4));
				nsc.add(room);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return nsc;
	}
	

	public boolean updateClass(Room r) {
		try {
			con.setAutoCommit(false);
			CallableStatement update = con.prepareCall("{call update_class_info(?,?,?,?,?)}");
			update.setInt(1, r.getId());
			update.setString(2, r.getName());
			update.setString(3, r.getColor());
			update.setInt(4, r.getCourse_id());
			update.setString(5, r.getDescription());
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
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean changeClassStatus(int id, int status) {
		try {
			con.setAutoCommit(false);
			CallableStatement change = con.prepareCall("{call changre_class_status(?,?)}");
			change.setInt(1, id);
			change.setInt(2, status);
			if (change.execute()) {
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
				e.printStackTrace();
			}
		}
		return false;
	}

	public ArrayList<Student> getStudentInClass(int class_id) {
		ArrayList<Student> stinfos = new ArrayList<Student>();
		try {
			CallableStatement getstinfo = con.prepareCall("{call get_student_in_class(?)}");
			getstinfo.setInt(1, class_id);
			getstinfo.execute();
			ResultSet rs = getstinfo.getResultSet();
			Student st = null;
			while (rs.next()) {
				st = new Student();
				st.setStu_id(rs.getString(1));
				st.setImg(rs.getString(2));
				st.setFname(rs.getString(3));
				st.setLname(rs.getString(4));
				st.setGender(rs.getString(5));
				st.setG_name(rs.getString(6));
				st.setCourse(rs.getString(7));
				st.setClass_name(rs.getString(8));
				st.setUniversit(rs.getString(9));
				st.setEmail(rs.getString(10));
				st.setPhone(rs.getString(11));
				stinfos.add(st);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return stinfos;
	}

	public ArrayList<Room> getActiveClassName() {
		ArrayList<Room> class_names = new ArrayList<Room>();
		try {
			CallableStatement getclass = con.prepareCall("{call get_active_class_name()}");
			getclass.execute();
			ResultSet rs = getclass.getResultSet();
			Room r = null;
			while (rs.next()) {
				r = new Room();
				r.setId(rs.getInt(1));
				r.setName(rs.getString(2));
				class_names.add(r);
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
		return class_names;
	}

	public Room getRoom(int id) {
		Room r = null;
		try {
			CallableStatement getcl = con.prepareCall("{call get_1class_info(?)}");
			getcl.setInt(1, id);
			getcl.execute();
			ResultSet rs = getcl.getResultSet();
			if (rs.next()) {
				r = new Room();
				r.setId(rs.getInt(1));
				r.setCourse_name(rs.getString(2));
				r.setName(rs.getString(3));
				r.setDescription(rs.getString(4));
				r.setColor(rs.getString(5));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return r;
	}

	public ArrayList<Room> getClassInCourse(int crsid) {
		ArrayList<Room> clsincrs = new ArrayList<Room>();
		try {
			CallableStatement getclsincrs = con.prepareCall("{call get_class_in_course(?)}");
			getclsincrs.setInt(1, crsid);
			getclsincrs.execute();
			ResultSet rs = getclsincrs.getResultSet();
			Room r = null;
			while (rs.next()) {
				r = new Room();
				r.setId(rs.getInt(1));
				r.setName(rs.getString(2));
				clsincrs.add(r);
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
		return clsincrs;
	}

	public static void main(String[] args) {
		// Room r=new Room(1,"Siem Reap","#948875",2,"Advance Course");
		// new RoomDAO().updateClass(r);
		// new RoomDAO().changeClassStatus(1,1);
		//
		// ArrayList<Student> stinfos=new RoomDAO().getStudentInClass(1);
		// for(Student r:stinfos){
		// System.out.println(r.getStu_id());
		// }
		// Room r=new RoomDAO().getRoom(1);
		// System.out.println(r.toString());

//		ArrayList<Room> r = new RoomDAO().getActiveClassName();
//		System.out.println(r);
		/*ArrayList<Room> r = new RoomDAO().getClassInCourse(5);
		for(Room rm:r){
			System.out.println(rm.getId()+","+rm.getName());
		}*/
		System.out.println(new RoomDAO().getNumberStudentInClass("","",""));
		}
		

}
