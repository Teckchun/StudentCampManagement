package controller.admin.classroom;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.RoomDAO;
import model.dto.Room;

/**
 * Servlet implementation class GetRoom
 */
@WebServlet("/GetRoom")
public class GetRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		Room r=new RoomDAO().getRoom(id);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String room=new Gson().toJson(r);
		response.getWriter().write(room);
		
		System.out.println(room);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
