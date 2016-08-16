package controller.message;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.MessageDAO;
import model.dto.Message;

/**
 * Servlet implementation class GetAllNewMessage
 */
@WebServlet("/GetAllNewMessage")
public class GetAllNewMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GetAllNewMessage() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		ArrayList<Message> ms=new MessageDAO().getAllMessage(user_id);
		
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
