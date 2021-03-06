package controller.admin.course;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.CourseDAO;
import model.dao.GenerationDAO;

import com.google.gson.Gson;

/**
 * Servlet implementation class ChangeCourseStatus
 */
@WebServlet("/ChangeCourseStatus")
public class ChangeCourseStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCourseStatus() {
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
		
		String couid=request.getParameter("couid");
		String coustatus=request.getParameter("coustatus");
		
		System.out.println(couid+" "+coustatus);
		  int id=Integer.parseInt(couid);
		  int cstatus=Integer.parseInt(coustatus);
		  boolean status=new CourseDAO().changeStatus(id, cstatus);
	      if(status){
	    	  System.out.println("Change");
	      }else{
	    	  System.out.println("Error changing");
	      }
	      response.setContentType("application/json");
		 response.setCharacterEncoding("UTF-8");
			String statuss= new Gson().toJson(status);
			response.getWriter().write(statuss);
		/*ArrayList<Generation> generations = new GenerationDAO().getAllGeneration();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String generation= new Gson().toJson(generations);
		response.getWriter().write(generation);

		System.out.println(generation);*/
	}
}
