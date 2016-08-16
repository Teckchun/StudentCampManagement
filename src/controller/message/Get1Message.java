package controller.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.MessageDAO;
import model.dto.Message;

/**
 * Servlet implementation class Get1Message
 */
@WebServlet("/Get1Message")
public class Get1Message extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Get1Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		String sms_id=request.getParameter("sms_id");
		
		Message ms=new MessageDAO().getOneMessage(user_id, sms_id);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String message=new Gson().toJson(ms);
		response.getWriter().write(message);
		System.out.println(message);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
