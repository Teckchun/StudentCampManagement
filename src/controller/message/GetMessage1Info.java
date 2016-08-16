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
 * Servlet implementation class GetMessage1Info
 */
@WebServlet("/GetMessage1Info")
public class GetMessage1Info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetMessage1Info() {
		super();
		// TODO Auto-generated constructor stub
	}
	///Get Message 1 Info
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ms_id=request.getParameter("ms_id");
		
		Message ms=new MessageDAO().get1MessageInfo(ms_id);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String message=new Gson().toJson(ms);
		response.getWriter().write(message);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
