package controller.admin.setting;

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
import model.dao.StudentDAO;
import model.dto.UserInfo;

import com.google.gson.Gson;

/**
 * Servlet implementation class AdminUpdateUserInfo
 */
@WebServlet("/AdminUpdateUserInfo")
public class AdminUpdateUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateUserInfo() {
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
		ArrayList<Object> s=(ArrayList<Object>) stu.getAttribute("admin");
		String adminid=s.get(0).toString();
		
		String username=request.getParameter("username");
		
		UserInfo user =new UserInfo();
		user.setUserid(adminid);
		user.setUsername(username);
		
		
		boolean status=AdminDAO.updateUserInfo(user) ;
		HttpSession session=request.getSession();
		session.setAttribute("admin", AdminDAO.refreshSession(adminid));
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		System.out.print(status);
		String sendstatus= new Gson().toJson(status);
		
		response.getWriter().write(sendstatus);
	}

}
