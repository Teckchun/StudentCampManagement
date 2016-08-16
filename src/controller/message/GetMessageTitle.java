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
 * Servlet implementation class GetMessageTitle
 */
@WebServlet("/GetMessageTitle")
public class GetMessageTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetMessageTitle() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Message> titles=new MessageDAO().getMessageTitle();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String mstitles=new  Gson().toJson(titles);
		response.getWriter().write(mstitles);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
