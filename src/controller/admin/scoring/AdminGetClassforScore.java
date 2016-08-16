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

import com.google.gson.Gson;

/**
 * Servlet implementation class AdminGetClassforScore
 */
@WebServlet("/AdminGetClassforScore")
public class AdminGetClassforScore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminGetClassforScore() {
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
		String subjectid=request.getParameter("subjectid");
		
		String position=a.get(3).toString();
		if(position.equalsIgnoreCase("admin")){
			System.out.print("Admin");
			staff="";
		}
		System.out.println("This is get class");
		
		ArrayList<Room> rooms = AdminDAO.getClassScore(staff, subjectid);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendrooms= new Gson().toJson(rooms);
		System.out.println(sendrooms);
		response.getWriter().write(sendrooms);
	}

}
