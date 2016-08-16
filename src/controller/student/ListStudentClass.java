package controller.student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.StudentDAO;
import model.dto.Score;

import com.google.gson.Gson;

/**
 * Servlet implementation class ListStudentClass
 */
@WebServlet("/ListStudentClass")
public class ListStudentClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListStudentClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SQLException {

		HttpSession stu = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Object> s = (ArrayList<Object>) stu.getAttribute("student");

		String generation = s.get(4).toString();
		String course = s.get(5).toString();
		//System.out.println("This is list student");
		
		ArrayList<String> stuclass = StudentDAO.listStudentClass(generation,course);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String stuclasslist = new Gson().toJson(stuclass);
		System.out.print(stuclasslist);
		response.getWriter().write(stuclasslist);
	}

}
