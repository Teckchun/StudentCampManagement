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
import model.dao.CourseDAO;
import model.dao.SubjectDAO;
import model.dto.Room;
import model.dto.Score;

import com.google.gson.Gson;

/**
 * Servlet implementation class AddStudentScore
 */
@WebServlet("/AddStudentScore")
public class AddStudentScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudentScore() {
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
		HttpSession ad=request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Object> a=(ArrayList<Object>) ad.getAttribute("admin");
		String staff=a.get(0).toString();
		
		
		String studentid=request.getParameter("studentid");
		String subjectid=request.getParameter("subjectid");
		String scoremonth=request.getParameter("scoremonth");
		float studentscore=(float) Double.parseDouble(request.getParameter("studentscore"));
		
		Score score=new Score();
		score.setMonth(scoremonth);
		score.setScore(studentscore);
		score.setSubj_id(subjectid);
		score.setStu_id(studentid);
		score.setStaff_id(staff);
		
		
		
		boolean status = false;
		if(AdminDAO.checkAddScore(score)==true){
			
			status=AdminDAO.addStudentScore(score);
			if(status){
				System.out.println("Saved");
			}else{
				System.out.println("Error Saving");
			}
			System.out.print(status);
		}else{
			status=false;
		}
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		response.getWriter().write(sendstatus);
	}

}
