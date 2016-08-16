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
 * Servlet implementation class ListRoom
 */
@WebServlet("/ListRoom")
public class ListRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    
		String genid=request.getParameter("genid");
		String courseid=request.getParameter("courseid");
		String status =request.getParameter("clsstatus");
		System.err.println(genid +"   "+courseid);
		ArrayList<Room> rooms=new RoomDAO().getNumberStudentInClass(genid,courseid,status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String room=new Gson().toJson(rooms);
		response.getWriter().write(room);
		
		System.out.println(room);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
