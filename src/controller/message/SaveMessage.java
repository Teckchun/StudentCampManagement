package controller.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MessageDAO;
import model.dto.Message;

/**
 * Servlet implementation class SaveMessage
 */
@WebServlet("/SaveMessage")
public class SaveMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  String sender_id=request.getParameter("sender_id");
		  String title=request.getParameter("title");
		  String description=request.getParameter("description");
		  String img_info=request.getParameter("img_info");
	      
		  Message sms=new Message();  
	      sms.setSms_id(new MessageDAO().getMessageId());
	      sms.setSender_id(sender_id);
	      sms.setTitle(title);
	      sms.setDescription(description);
	      sms.setImg_info(img_info);
	      
	      if(new MessageDAO().saveMessage(sms)){
	    	  System.out.println("Message Saved");
	      }else{
	    	  System.out.println("Message save failed");
	      }
	}

}
