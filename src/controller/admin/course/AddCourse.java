package controller.admin.course;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CourseDAO;
import model.dao.GenerationDAO;
import model.dto.Course;

import com.google.gson.Gson;

/**
 * Servlet implementation class AddCourse
 */
@WebServlet("/AddCourse")
public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

		
		String course_type = request.getParameter("coursename");
		String description = request.getParameter("coursedescription");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		int g_id = Integer.parseInt(request.getParameter("generation"));
		
		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date( startdate);
		java.sql.Date orientdate = new java.sql.Date(myDate.getTime());
		@SuppressWarnings("deprecation")
		java.util.Date myDate1 = new java.util.Date( enddate);
		java.sql.Date finishdate = new java.sql.Date(myDate1.getTime());
		
		Course crs = new Course(course_type, description, orientdate, finishdate, g_id);
		boolean status=new CourseDAO().addCourse(crs);
		if(status){
			System.out.println("Saved");
		}else{
			System.out.println("Error Saving");
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		response.getWriter().write(sendstatus);
	}

}
