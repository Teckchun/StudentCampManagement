package controller.admin.classroom;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.RoomDAO;
import model.dto.Room;

/**
 * Servlet implementation class GetClassInCourse
 */
@WebServlet("/GetClassInCourse")
public class GetClassInCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetClassInCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int crsid=Integer.parseInt(request.getParameter("courseid"));
		
		ArrayList<Room> clsincrs=new RoomDAO().getClassInCourse(crsid);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String clses=new Gson().toJson(clsincrs);
		response.getWriter().write(clses);
		
		System.out.println(clses);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
