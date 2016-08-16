package controller.notification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.NotificationDAO;

/**
 * Servlet implementation class NotificationToZero
 */
@WebServlet("/NotificationToZero")
public class NotificationToZero extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NotificationToZero() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		if(new NotificationDAO().changeNotificationToZero(user_id)){
			System.out.println("Change to zero successed!");
		}else{
			System.out.println("Change to zero failed!");
		}
	}

}
