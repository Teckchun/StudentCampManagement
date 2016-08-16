package controller.notification;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.NotificationDAO;

/**
 * 
 */
@WebServlet(urlPatterns = {"/mynotification"}, asyncSupported = true)
public class GetNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        //content type must be set to text/event-stream
	        response.setContentType("text/event-stream");   
	        //encoding must be set to UTF-8
	        response.setCharacterEncoding("UTF-8");
	        String id =request.getParameter("logid");
	        System.out.println(id);
	        PrintWriter writer = response.getWriter();
	        	int getnum=new NotificationDAO().getNumberNotif(id);
	        	writer.write("data:"+getnum+"\n\n");
	            System.out.println(getnum);     
	       // writer.close();
	    }
}
