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

import com.google.gson.Gson;

/**
 * Servlet implementation class AdminGetSubjectforScore
 */
@WebServlet("/AdminGetSubjectforScore")
public class AdminGetSubjectforScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGetSubjectforScore() {
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
		String position=a.get(3).toString();
		if(position.equalsIgnoreCase("admin")){
			System.out.print("Admin");
			staff="";
		}
		System.out.print(staff);
		System.out.println("This is get Score");
		
		ArrayList<model.dto.Subject> subject = AdminDAO.getSubjectScore(staff);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendsubject= new Gson().toJson(subject);
		System.out.println(sendsubject);
		response.getWriter().write(sendsubject);
	}

}
