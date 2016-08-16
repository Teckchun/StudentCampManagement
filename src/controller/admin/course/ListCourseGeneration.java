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
import model.dto.Generation;

import com.google.gson.Gson;

/**
 * Servlet implementation class ListCourseGeneration
 */
@WebServlet("/ListCourseGeneration")
public class ListCourseGeneration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCourseGeneration() {
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
		
		    ArrayList<Generation> generation=new GenerationDAO().getActiveGeneration();
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    String sendgeneration=new Gson().toJson(generation);
		    response.getWriter().write(sendgeneration);
		    System.out.println(sendgeneration);
	}

}
