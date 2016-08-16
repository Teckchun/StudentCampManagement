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
import model.dto.UserInfo;

import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateUserInfo
 */
@WebServlet("/UpdateUserInfo")
public class UpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfo() {
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
		
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		
		UserInfo user =new UserInfo();
		user.setUserid(stuid);
		user.setUsername(username);
		user.setEmail(email);
		
		boolean status=StudentDAO.updateUserInfo(user) ;
		HttpSession session=request.getSession();
		session.setAttribute("student", StudentDAO.refreshSession(stuid));
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		
		response.getWriter().write(sendstatus);
	}

}
