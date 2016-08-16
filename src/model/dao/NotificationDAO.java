package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import Utility.DBConnection;

public class NotificationDAO {
       private Connection con;
       
       public NotificationDAO(){
    	      con=DBConnection.getConnect();
       }
       
       public int getNumberNotif(String id){
    	   int note=0;
    	   try{
    		   CallableStatement getnumber=con.prepareCall("{ call get_number_notification(?)}");
    		   getnumber.setString(1,id);
    		   getnumber.execute();
    		   ResultSet rs=getnumber.getResultSet();
    		   if(rs.next()){
    			   note=rs.getInt(1);
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
    	   return note;
       }
       public boolean increaseNotification(){
    	   try{
    		   con.setAutoCommit(false);
    		   CallableStatement increase=con.prepareCall("{call increase_notification()}");
    		   if(increase.execute()){
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
       
       public boolean descreaseNotification(String id){
    	   try{
    		   con.setAutoCommit(false);
    		   CallableStatement descrease=con.prepareCall("{call descrease_notification(?)}");
    		   descrease.setString(1,id);
    		   if(descrease.execute()){
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
       public boolean saveNotification(String stu_id){
    	   try{
    		   con.setAutoCommit(false);
    		   CallableStatement save=con.prepareCall("{call save_notification(?)}");
    		   save.setString(1,stu_id);
    		   if(save.execute()){
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
       public boolean changeNotificationToZero(String user_id){
    	   try{
    		   con.setAutoCommit(false);
    		   CallableStatement tozero=con.prepareCall("{call change_notification_to_zero(?)}");
    		   tozero.setString(1,user_id);
    		   if(tozero.execute()){
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
		 ///int note=new NotificationDAO().getNumberNotif("SF-003");
		// System.out.println(note);
    	// new NotificationDAO().increaseNotification();
    	//new NotificationDAO().descreaseNotification("ST0001");
    	  new NotificationDAO().saveNotification("ST0007"); 
	}
}
