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
 * Servlet implementation class UpdateRoom
 */
@WebServlet("/UpdateRoom")
public class UpdateRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("classname");
		String color=request.getParameter("color");
		int course_id=Integer.parseInt(request.getParameter("coursetype"));
		String description=request.getParameter("description");
		
		Room r=new Room();
		r.setId(id);
		r.setName(name);
		r.setColor(color);
		r.setCourse_id(course_id);
		r.setDescription(description);
		
		if(new RoomDAO().updateClass(r)){
			System.out.println("Update class Ok");
		}else{
			System.out.println("Update class fialure");
		}

	}

}
