package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.Score;
import model.dto.Staff;
import Utility.DBConnection;

public class DashboardDAO {

	private Connection con;

	public DashboardDAO() {
		con = DBConnection.getConnect();

	}
	public ArrayList<Score> getTopStudent(){
		ArrayList<Score> scores=new ArrayList<Score>();
		try {
			con.setAutoCommit(false);
			CallableStatement cs = con.prepareCall("{call get_heightscore()}");
			cs.execute();
			ResultSet rs=cs.getResultSet();
			Score sc=null;
			while(rs.next()){
				sc=new Score();
				sc.setStu_name(rs.getString(1));
				sc.setStu_id(rs.getString(2));
				sc.setMonth(rs.getString(3));
				sc.setScore(rs.getFloat(4));
				sc.setStu_profile(rs.getString(5));
				scores.add(sc);
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
		
		return scores;
	}
	
	
	public int countAdmin()
	{
		String sql="SELECT COUNT(staff_id) FROM tbl_staffs WHERE position='admin'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				int rowcount=rs.getInt(1);
				return rowcount;
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
		
	public int countTeacher(){
		String sql = "SELECT COUNT(*) FROM tbl_staffs WHERE position='teacher' ";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int rowcount = rs.getInt(1);
				return rowcount;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;


	}
	
	public int countUser(){
		try {
			con.setAutoCommit(false);
			CallableStatement cs = con.prepareCall("{call count_userf()}");
			cs.execute();
			ResultSet rs = cs.getResultSet();
			while(rs.next()){
				int rowcount = rs.getInt(1);
				return rowcount;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	public int countStudent() {
		try {
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM tbl_students");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int rowcount = rs.getInt(1);
				return rowcount;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return 0;
		
	}
	
	public int countClass(){
		String sql = "SELECT COUNT(*) FROM tbl_class ";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int rowcount = rs.getInt(1);
				return rowcount;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;

	}
	
	
	/*NEW STAFFS*/
	public ArrayList<Staff> newStaff()
	{
		ArrayList<Staff> staff=new ArrayList<Staff>();
		try {
			CallableStatement cs=con.prepareCall("{call new_user()}");
			cs.execute();
			ResultSet rs=cs.getResultSet();
			while(rs.next())
			{
				Staff staffs=new Staff();
				staffs.setName(rs.getString(1));
				staffs.setImagesrc(rs.getString(2));
				staff.add(staffs);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return staff;

	}
	public static void main(String[] args) {
		System.out.print(new DashboardDAO().newStaff());
	}
	
}
