package controller.admin.addstudent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.StudentDAO;
import model.dto.Student;

/**
 * Servlet implementation class GetStudent
 */
@WebServlet("/GetStudent")
public class GetStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GetStudent() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		Student student;
		try {
			student = new StudentDAO().getStudent(id);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			String st=new Gson().toJson(student);
			response.getWriter().write(st);
			System.out.println(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
