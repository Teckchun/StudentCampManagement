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
import model.dto.Student;

/**
 * Servlet implementation class GetStudentInRoom
 */
@WebServlet("/GetStudentInRoom")
public class GetStudentInRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetStudentInRoom() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println(request.getParameter("classid"));
		int class_id=Integer.parseInt(request.getParameter("classid"));
		System.out.print(class_id);
		ArrayList<Student> students=new RoomDAO().getStudentInClass(class_id);
	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String student=new Gson().toJson(students);
		response.getWriter().write(student);
		
		System.out.println(student);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
