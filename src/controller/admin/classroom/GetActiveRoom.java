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
 * Servlet implementation class GetActiveRoom
 */
@WebServlet("/GetActiveRoom")
public class GetActiveRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetActiveRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Room> rs = new RoomDAO().getActiveClassName();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String rooms = new Gson().toJson(rs);
		response.getWriter().write(rooms);

		System.out.println(rooms);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
