package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import Utility.DBConnection;
import model.dto.Staff;

public class StaffDAO {
	private Connection con;

	public StaffDAO() {
		con = DBConnection.getConnect();
	}

	public String getAutoId() {
		int row=new StaffDAO().getNumberofRow();
		String stid = "";
		try {
			CallableStatement getid = con.prepareCall("{call get_max_staff_id()}");
			getid.execute();
			ResultSet rs = getid.getResultSet();
			if (rs.next()&&row!=0) {
				String cut[] = rs.getString(1).split("-");
				int back = Integer.parseInt(cut[1]);
				if (back < 9) {
					back += 1;
					stid = "SF-00" + back;
				} else if(back<98){
					back += 1;
					stid = "SF-0" + back;
				}else if(back<998){
					back += 1;
					stid = "SF-" + back;
				}
			} else {
				stid = "SF-001";
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

	public boolean addStaff(Staff sf) {
		try {
			con.setAutoCommit(false);
			CallableStatement insert = con.prepareCall("{call add_staff(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			insert.setString(1, sf.getId());
			insert.setString(2, sf.getName());
			insert.setString(3, "" + sf.getGender());
			insert.setString(4, sf.getUsername());
			insert.setString(5, sf.getPwd());
			insert.setDate(6, new java.sql.Date(sf.getDob().getTime()));
			insert.setString(7, sf.getAddress());
			insert.setString(8, sf.getEmail());
			insert.setString(9, sf.getPhone());
			insert.setString(10, sf.getImagesrc());
			insert.setString(11, sf.getProfile());
			insert.setString(12, sf.getBgimag());
			insert.setString(13, sf.getPosition());
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
	public int getNumberofRow(){
		   int row=0;
	       try{
	    	   CallableStatement number=con.prepareCall("{call number_of_row_stafftbl()}");
	    	   number.execute();
	    	   ResultSet rs=number.getResultSet();
	    	   if(rs.next()){
	    	   row=rs.getInt(1);
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
	       return row;
	}
	public boolean updateStaff(Staff sf) {
		try {
			con.setAutoCommit(false);
			CallableStatement insert = con.prepareCall("{call update_staff(?,?,?,?,?,?,?,?,?)}");
			insert.setString(1, sf.getId());
			insert.setString(2, sf.getName());
			insert.setString(3, "" + sf.getGender());
			insert.setDate(4, new java.sql.Date(sf.getDob().getTime()));
			insert.setString(5, sf.getAddress());
			insert.setString(6, sf.getEmail());
			insert.setString(7, sf.getPhone());
			insert.setString(8, sf.getProfile());
			insert.setString(9, sf.getPosition());
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
	public boolean changeStatus(String id,int status){
		try{
			con.setAutoCommit(false);
			CallableStatement update=con.prepareCall("{call chage_staff_status(?,?)}");
			update.setString(1,id);
			update.setInt(2,status);
			if(update.execute()){
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
	public ArrayList<Staff> listActiveStaff(){
		ArrayList<Staff> staffs=new ArrayList<Staff>();
		try{
			CallableStatement getstaff=con.prepareCall("{call get_active_staff()}");
			getstaff.execute();
			ResultSet rs=getstaff.getResultSet();
			Staff stf=null;
			while(rs.next()){
				stf=new Staff();
				stf.setId(rs.getString(1));
				stf.setName(rs.getString(2));
				staffs.add(stf);
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
		return staffs;
	}
	public ArrayList<Staff> getStaffInfo(){
		ArrayList<Staff> staffs=new ArrayList<Staff>();
		try{
			CallableStatement getstaff=con.prepareCall("{call get_staff_info()}");
			getstaff.execute();
			ResultSet rs=getstaff.getResultSet();
			Staff sf=null;
			while(rs.next()){
				sf=new Staff(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getString(7),rs.getInt(8));
				staffs.add(sf);
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
		return staffs;
	}
	public Staff getStaff(String id){
		Staff sf=null;
		try{
			CallableStatement getstaff=con.prepareCall("{call get_1staff_info(?)}");
			getstaff.setString(1,id);
			getstaff.execute();
			ResultSet rs=getstaff.getResultSet();
			if(rs.next()){
				sf=new Staff();
				sf.setId(rs.getString(1));
				sf.setName(rs.getString(2));
				sf.setGender(rs.getString(3));
				sf.setDob(rs.getDate(4));
				sf.setAddress(rs.getString(5));
				sf.setEmail(rs.getString(6));
				sf.setPhone(rs.getString(7));
				sf.setProfile(rs.getString(8));
				sf.setPosition(rs.getString(9));
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
		return sf;
	}
	
	public boolean changeStaffStatus(String id,int status){
		Connection con=DBConnection.getConnect();
		try{
			con.setAutoCommit(false);
			PreparedStatement change=con.prepareStatement(" UPDATE tbl_staffs SET status=? WHERE staff_id=?");
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
		/*String id = new StaffDAO().getAutoId();
		System.out.println(id);
		int row=new StaffDAO().getNumberofRow();
		System.out.println(row);
	    Staff sf=new Staff();
	    sf.setId(new StaffDAO().getAutoId());
	    sf.setName("Lach Phalleak");
	    sf.setGender('M');
	    sf.setUsername("phalleak");
	    sf.setPwd("123");
	    sf.setDob(new Date("1992/04/30"));
	    sf.setAddress("KT");
	    sf.setEmail("phalleak@gmail.com");
	    sf.setPhone("0965967596");
	    sf.setImagesrc("1image");
	    sf.setProfile("p1image");
	    sf.setBgimag("b1image");
	    sf.setPosition("Director");
	    new StaffDAO().addStaff(sf);
	    new StaffDAO().changeStatus("ST-02",1);*/
//		ArrayList<String> staffs=new StaffDAO().listStaff();
//		for(String st:staffs){
//			System.out.println(st);
//		}
//		ArrayList<Staff> sts=new StaffDAO().getStaffInfo();
//		System.out.println(sts);
//		    for(Staff staffs:sts){
		/*    Staff staffs=new StaffDAO().getStaff("SF-02");
			System.out.println(staffs);*/
//		    }
//		ArrayList<Staff> stf=new StaffDAO().listActiveStaff();
//		System.out.println(stf);
		System.out.print(new StaffDAO().changeStaffStatus("SF-11", 0));
	}
}
