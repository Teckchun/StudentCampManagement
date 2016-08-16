package controller.admin.studentresult;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.GenerationDAO;
import model.dao.StudentDAO;
import model.dto.Generation;
import model.dto.Score;

import com.google.gson.Gson;

/**
 * Servlet implementation class ListAllStudentResult
 */
@WebServlet("/ListAllStudentResult")
public class ListAllStudentResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListAllStudentResult() {
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
	
	
		String month=request.getParameter("month");
		String stuclass=request.getParameter("classid");
		String course=request.getParameter("courseid");
		String generation=request.getParameter("genid");
		
		System.out.print(stuclass);
		
		ArrayList<Score> sturesult=StudentDAO.listAllStudentResult(generation,course,stuclass, month);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sturesultlist= new Gson().toJson(sturesult);
		System.out.print(sturesultlist);
		response.getWriter().write(sturesultlist);
	}

}
