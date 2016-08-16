package controller.admin.course;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.CourseDAO;
import model.dto.Course;

/**
 * Servlet implementation class GetCourseType
 */
@WebServlet("/GetCourseType")
public class GetCourseType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetCourseType() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    ArrayList<Course> coursetypes=new CourseDAO().listCourseType();
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    
		    String coursetype=new Gson().toJson(coursetypes);
		    response.getWriter().write(coursetype);
		    System.out.println(coursetype);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
