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
 * Servlet implementation class GetMessageInfoForAdmin
 */
@WebServlet("/GetMessageInfoForAdmin")
public class GetMessageInfoForAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GetMessageInfoForAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Message> ms=new MessageDAO().getMessageInfoAdmin();
		
		response.setContentType("appliction/json");
		response.setCharacterEncoding("UTF-8");
		
		String messages=new Gson().toJson(ms);
		response.getWriter().write(messages);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
