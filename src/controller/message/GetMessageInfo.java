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
 * Servlet implementation class GetMessageInfo
 */
@WebServlet("/GetMessageInfo")
public class GetMessageInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GetMessageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id=request.getParameter("user_id");
		ArrayList<Message> messages=new MessageDAO().getMessageInfo(user_id);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String ms=new Gson().toJson(messages);
		response.getWriter().write(ms);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
