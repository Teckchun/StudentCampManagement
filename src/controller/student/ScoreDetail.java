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

import com.google.gson.Gson;

import model.dao.StudentDAO;
import model.dto.Score;

/**
 * Servlet implementation class ScoreDetail
 */
@WebServlet("/ScoreDetail")
public class ScoreDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreDetail() {
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
		
		HttpSession stu=request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Object> s=(ArrayList<Object>) stu.getAttribute("student");
		String stuid=s.get(0).toString();
		String scoremonth=request.getParameter("scoremonth");
		System.out.print(stuid);
		ArrayList<Score> stuscore=StudentDAO.listScoreSpecificDetail(stuid, scoremonth);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String stuscorelist= new Gson().toJson(stuscore);
		System.out.print(stuscorelist);
		response.getWriter().write(stuscorelist);
	}

}
