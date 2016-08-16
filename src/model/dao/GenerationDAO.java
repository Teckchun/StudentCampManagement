package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.Generation;
import Utility.DBConnection;

public class GenerationDAO {
	private Connection con;
	public GenerationDAO(){
		con=DBConnection.getConnect();
	}
	
	public boolean insertGeneration(Generation g){
		try{
			con.setAutoCommit(false);
			CallableStatement insert=con.prepareCall("{ call add_generation(?,?,?,?)}");
			insert.setString(1,g.getName());
			insert.setDate(2,new java.sql.Date(g.getOrient_date().getTime()));
			insert.setDate(3,new java.sql.Date(g.getFinish_date().getTime()));
			insert.setString(4,g.getDescription());
			if(insert.execute()){
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
	public ArrayList<Generation> getAllGeneration(){
		ArrayList<Generation> all=new ArrayList<Generation>();
		try{
			CallableStatement getAll=con.prepareCall("{ call get_all_generation()}");
			getAll.execute();
			ResultSet rs=getAll.getResultSet();
			Generation g=null;
			while(rs.next()){
				g=new Generation(rs.getInt("g_id"),rs.getString("generation"),rs.getDate("orientation_date"),
						rs.getDate("finish_date"),rs.getInt("status"),rs.getDate("create_date"),rs.getString("discription"));
				all.add(g);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return all;
	}
	public ArrayList<Generation> getGenerationCombo(){
		ArrayList<Generation> all=new ArrayList<Generation>();
		try{
			PreparedStatement ps=con.prepareStatement("SELECT g_id,generation FROM tbl_generation ORDER BY g_id");
			ps.executeQuery();
			ResultSet rs=ps.getResultSet();
			while(rs.next()){
				Generation generation=new Generation();
				generation.setId(rs.getInt(1));
				generation.setName(rs.getString(2));
				all.add(generation);
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return all;
	}
	
	public boolean editGeneration(Generation g){
		try{
			con.setAutoCommit(false);
			CallableStatement update=con.prepareCall("{ call update_generation(?,?,?,?,?)}");
			update.setInt(1,g.getId());
			update.setString(2,g.getName());
			update.setDate(3,new java.sql.Date(g.getOrient_date().getTime()));
			update.setDate(4,new java.sql.Date(g.getFinish_date().getTime()));
			update.setString(5, g.getDescription());
			if(update.execute()){
				con.commit();
				return true;
			}
			else{
				con.rollback();
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return false;
	}
	public boolean changeGenerationStatus(int id,int status){
		try{
			con.setAutoCommit(false);
			PreparedStatement change=con.prepareStatement(" UPDATE tbl_generation SET status=? WHERE g_id=?; "
					+ "UPDATE tbl_course SET status=? WHERE g_id=?; "
					+ " UPDATE tbl_class set status=? WHERE course_id IN(SELECT course_id FROM tbl_course WHERE g_id=?)");
			change.setInt(1,status);
			change.setInt(2, id);
			change.setInt(3,status);
			change.setInt(4, id);
			change.setInt(5,status);
			change.setInt(6, id);
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
	public ArrayList<String> listGeneration(){
		ArrayList<String> generations=new ArrayList<String>();
		try{
			CallableStatement getgeneration=con.prepareCall("{call get_active_generation()}");
			getgeneration.execute();
			ResultSet rs=getgeneration.getResultSet();
			while(rs.next()){
				generations.add(rs.getString(1));
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
		return generations;
	}
	public Generation getGeneration(int id){
		Generation gn=null;
		try{
			CallableStatement getgn=con.prepareCall("{call get_1generation_info(?)}");
			getgn.setInt(1,id);
			getgn.execute();
			ResultSet rs=getgn.getResultSet();
		    if(rs.next()){
		    	gn=new Generation();
		    	gn.setId(rs.getInt(1));
		    	gn.setName(rs.getString(2));
		    	gn.setOrient_date(rs.getDate(3));
		    	gn.setFinish_date(rs.getDate(4));
		    	gn.setDescription(rs.getString(5));
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
		return gn;
	}
	public ArrayList<Generation> getActiveGeneration(){
		ArrayList<Generation> generations=new ArrayList<Generation>();
		try{
			CallableStatement getactgen=con.prepareCall("{call get_active_generation()}");
			getactgen.execute();
			ResultSet rs=getactgen.getResultSet();
			while(rs.next()){
				Generation generation=new Generation();
				generation.setId(rs.getInt(1));
				generation.setName(rs.getString(2));
				generations.add(generation);
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
		return generations;
	}
	public static void main(String[] args) {
//		Generation g=new Generation(2,"2nd Generation",new java.util.Date("2014/04/01"),new java.util.Date("2014/08/31"),"80 Students");
//		new GenerationDAO().editGeneration(g);
//		ArrayList<Generation> arr=new GenerationDAO().getAllGeneration();
//		for(Generation g1:arr){
//			System.out.println(g1.toString());
//		}
		System.out.print(new GenerationDAO().changeGenerationStatus(5, 1));
	}
}
