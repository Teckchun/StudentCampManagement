package controller.admin.classroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RoomDAO;
import model.dto.Room;

/**
 * Servlet implementation class AddRoom
 */
@WebServlet("/AddRoom")
public class AddRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int course_id = Integer.parseInt(request.getParameter("coursetype"));
		String name = request.getParameter("classname");
		String description = request.getParameter("description");
		String color = request.getParameter("color");
		Room r = new Room(name, color, course_id, description);

		if (new RoomDAO().addClass(r)) {
			System.out.println("Add Class Ok");
		} else {
			System.out.println("Add class fialure");
		}
	}

}
