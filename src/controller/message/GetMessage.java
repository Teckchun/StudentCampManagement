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
 * Servlet implementation class GetMessage
 */
@WebServlet("/GetMessage")
public class GetMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GetMessage() {
		super();
	}
	//To notification
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		ArrayList<Message> msm=new MessageDAO().getMessage(user_id);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String messages=new Gson().toJson(msm);
		response.getWriter().write(messages);
		
		System.out.println(messages);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}
