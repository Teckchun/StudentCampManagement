package controller.admin.addstudent;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.StudentDAO;

/**
 * Servlet implementation class GetAutoId
 */
@WebServlet("/GetAutoId")
public class GetAutoId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetAutoId() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            String student_id;
			try {
				student_id = new StudentDAO().getStudentID();
				  response.setContentType("application/json");
		            response.setCharacterEncoding("UTF-8");
		            
		            String id=new Gson().toJson(student_id);
		            response.getWriter().write(id);
		            
		            System.out.println(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            
 	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
