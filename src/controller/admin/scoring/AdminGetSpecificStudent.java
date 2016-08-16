package controller.admin.scoring;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AdminDAO;
import model.dto.Room;
import model.dto.StudentScore;

import com.google.gson.Gson;

/**
 * Servlet implementation class AdminGetSpecificStudent
 */
@WebServlet("/AdminGetSpecificStudent")
public class AdminGetSpecificStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGetSpecificStudent() {
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
		/*HttpSession ad=request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Object> a=(ArrayList<Object>) ad.getAttribute("admin");
		String admin=a.get(0).toString();
		String subjectid=request.getParameter("subjectid");*/
		
		String scoremonth=request.getParameter("scoremonth");
		String stusubject=request.getParameter("stusubject");
		int stuclass=Integer.parseInt(request.getParameter("stuclass"));
		System.out.println("This is get list student");
		
		ArrayList<StudentScore> students = AdminDAO.getScoreListStudent(scoremonth, stusubject, stuclass);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstudents= new Gson().toJson(students);
		System.out.println(sendstudents);
		response.getWriter().write(sendstudents);
	}
}
