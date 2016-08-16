package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Utility.DBConnection;
import model.dto.Message;

public class MessageDAO {
	
	private Connection con;
	public MessageDAO(){
		con=DBConnection.getConnect();
	}
	
	public int getNumMessageRow(){
		int row=0;
		try{
			CallableStatement nrow=con.prepareCall("{call get_number_row_message_table()}");
			nrow.execute();
		    ResultSet rs=nrow.getResultSet();
		    if(rs.next()){
		    	row=rs.getInt(1);
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
		return row;
	}
	public String getMessageId(){
		String autoid="";
		int nrow=new MessageDAO().getNumMessageRow();
		try{
			CallableStatement mid=con.prepareCall("{call get_max_message_id()}");
			mid.execute();
			ResultSet rs=mid.getResultSet();
			if(rs.next()&&nrow!=0){
				int back=Integer.parseInt(rs.getString(1).substring(2));
				if(back<9){
					back+=1;
					autoid="MS00000"+back;
				}else if(back<99){
					back+=1;
					autoid="MS0000"+back;
				}else if(back<999){
					back+=1;
					autoid="MS000"+back;
				}else if(back<9999){
					back+=1;
					autoid="MS00"+back;
				}else if(back<99999){
					back+=1;
					autoid="MS0"+back;
				}else if(back<999999){
					back+=1;
					autoid="MS"+back;
				}
			}else{
				autoid="MS000001";
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
		return autoid;
	}
	public boolean saveMessage(Message ms){
		try{
			con.setAutoCommit(false);
			CallableStatement save=con.prepareCall("{call  save_message(?,?,?,?,?)}");
			save.setString(1,ms.getSms_id());
			save.setString(2,ms.getSender_id());
			save.setString(3,ms.getTitle());
			save.setString(4,ms.getDescription());
			save.setString(5,ms.getImg_info());
			if(save.execute()){
				con.commit();
				new NotificationDAO().increaseNotification();
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public ArrayList<Message> getMessage(String user_id){
		  ArrayList<Message> messages=new ArrayList<Message>();
		  Message ms=null;
		  try{
			  CallableStatement getms=con.prepareCall("{call  get_message(?)}");
			  getms.setString(1,user_id);
			  getms.execute();
			  ResultSet rs=getms.getResultSet();
			  while(rs.next()){
				  ms=new Message();
				  ms.setUser_id(rs.getString(1));
				  ms.setSms_id(rs.getString(2));
				  ms.setTitle(rs.getString(3));
				  ms.setSender(rs.getString(5));
				  ms.setTime(rs.getString(6));
				  ms.setSender_img(rs.getString(8));
				  ms.setPost_date(rs.getString(10));
				  messages.add(ms);
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
		  return messages;
	}
	public boolean changeMessageStatus(String user_id,String ms_id){
		try{
			con.setAutoCommit(false);
			CallableStatement change=con.prepareCall("{call delete_message_from_user(?,?)}");
			change.setString(1,user_id);
			change.setString(2,ms_id);
			if(change.execute()){
				con.commit();
				    new NotificationDAO().descreaseNotification(user_id);
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public int getMessageStatus(String user_id,String sms_id){
		   int mstatus=0;
		   try{
			   CallableStatement getstatus=con.prepareCall("{call get_message_status(?,?)}");
			   getstatus.setString(1,user_id);
			   getstatus.setString(2,sms_id);
			   getstatus.execute();
			   ResultSet rs=getstatus.getResultSet();
			   if(rs.next()){
				   mstatus=rs.getInt(1);
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
		   return mstatus;
	}
	public boolean deleteReadMessage(String user_id){
		try{con.setAutoCommit(false);
		CallableStatement del=con.prepareCall("{call delete_message_from_user(?)}");
		del.setString(1,user_id);
		if(del.execute()){
			con.commit();
			 new NotificationDAO().changeNotificationToZero(user_id);
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
	public Message getOneMessage(String user_id,String sms_id){
		  Message ms=null;
		  try{
			  CallableStatement getms=con.prepareCall("{call  get_1message(?,?)}");
			  getms.setString(1,user_id);
			  getms.setString(2,sms_id);
			  getms.execute();
			  ResultSet rs=getms.getResultSet();
			  if(rs.next()){
				  ms=new Message();
				  ms.setTitle(rs.getString(3));
				  ms.setDescription(rs.getString(4));
				  ms.setSender(rs.getString(5));
				  ms.setTime(rs.getString(6));
				  ms.setSender_img(rs.getString(8));
				  ms.setImg_info(rs.getString(9));
				  ms.setPost_date(rs.getString(10));
			  }
			new MessageDAO().changeMessageStatus(user_id, sms_id);
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
		  return ms;
	} 
	public ArrayList<Message> getAllMessage(String user_id){
		ArrayList<Message> messages=new ArrayList<Message>();
		Message ms=null;
		try{
			CallableStatement getms=con.prepareCall("{call get_message(?)}");
			getms.setString(1,user_id);
			getms.execute();
			ResultSet rs=getms.getResultSet();
			  while(rs.next()){
				  ms=new Message();
				  ms.setTitle(rs.getString(3));
				  ms.setDescription(rs.getString(4));
				  ms.setSender(rs.getString(5));
				  ms.setTime(rs.getString(6));
				  ms.setSender_img(rs.getString(8));
				  ms.setImg_info(rs.getString(9));
				  ms.setPost_date(rs.getString(10));
				  messages.add(ms);
			  }
			  new MessageDAO().deleteReadMessage(user_id);
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
		return messages;
	}
	public ArrayList<Message> getMessageInfo(String user_id){
		ArrayList<Message> messages=new ArrayList<Message>();
		Message ms=null;
		try{
			CallableStatement getms=con.prepareCall("{call get_message()}");
			getms.execute();
			ResultSet rs=getms.getResultSet();
			while(rs.next()){
				ms=new Message();
				ms.setSms_id(rs.getString(1));
				ms.setSender(rs.getString(2));
				ms.setTitle(rs.getString(3));
				ms.setImg_info(rs.getString(5));
				ms.setPost_date(rs.getString(6));
				ms.setTime(rs.getString(7));
				ms.setSender_img(rs.getString(8));
				messages.add(ms);
			}
			  new MessageDAO().deleteReadMessage(user_id);
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
		return messages;
	}
	public Message get1MessageInfo(String ms_id){
		Message message=null;
		try{
			CallableStatement getms=con.prepareCall("{call get_1message_info(?)}");
			getms.setString(1,ms_id);
			getms.execute();
			ResultSet rs=getms.getResultSet();
			if(rs.next()){
				message=new Message();
				message.setSender(rs.getString(2));
				message.setTitle(rs.getString(3));
				message.setDescription(rs.getString(4));
				message.setImg_info(rs.getString(5));
				message.setPost_date(rs.getString(6));
				message.setTime(rs.getString(7));
				message.setSender_img(rs.getString(8));
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
		return message;
	}
	public ArrayList<Message> getMessageTitle(){
		ArrayList<Message> mstitle=new ArrayList<Message>();
		Message ms=null;
		try{
			String sql="SELECT msm_id,title FROM tbl_message ORDER BY msm_id";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				ms=new Message();
				ms.setSms_id(rs.getString(1));
				ms.setTitle(rs.getString(2));
				mstitle.add(ms);
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
		return mstitle;
	}
	public ArrayList<Message> getMessageInfoAdmin(){
		ArrayList<Message> messages=new ArrayList<Message>();
		Message ms=null;
		try{
			String sql="SELECT stf_name,title,description,img_info,post_date,post_time,profilesrc FROM v_message_info";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				ms=new Message();
				ms.setSender(rs.getString(1));
				ms.setTitle(rs.getString(2));
				ms.setDescription(rs.getString(3));
				ms.setImg_info(rs.getString(4));
				ms.setPost_date(rs.getString(5));
				ms.setTime(rs.getString(6));
				ms.setSender_img(rs.getString(7));
				messages.add(ms);
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
		return messages;
	}
	public static void main(String[] args) {
		/*Message ms=new Message();
		ms.setSms_id(new MessageDAO().getMessageId());
		ms.setSender_id("SF-001");
		ms.setTitle("Pinic");
		ms.setDescription("On 4 September 2015 8:00 am");
		new MessageDAO().saveMessage(ms);*/
		//System.out.println(new MessageDAO().getMessageStatus("ST0001","MS000001"));
		/*ArrayList<Message> messages=new MessageDAO().getMessageInfo();
		for(Message ms:messages){
			System.out.println(ms.toString());
		}*/
		//new MessageDAO().changeMessageStatus("ST0001","MS000001");
		//System.out.println(new MessageDAO().getOneMessage("ST0001","MS000001"));
		//System.out.println(new MessageDAO().get1MessageInfo("MS000001"));
	}
}
