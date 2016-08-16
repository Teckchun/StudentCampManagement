package controller.login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.AdminDAO;
import model.dao.StudentDAO;

/**
 * Servlet implementation class AdminActionLogin
 */
@WebServlet("/AdminActionLogin")
public class AdminActionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminActionLogin() {
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
		String username=request.getParameter("username");
		String password=request.getParameter("pass");
		System.out.print(username+" "+password);
		
		
		if(AdminDAO.checkLogin(username, password)!=null){
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			String redirect= "view/dashboard.jsp";
			response.getWriter().write(redirect);
			System.out.println(redirect);
			HttpSession session=request.getSession();
			session.setAttribute("admin", AdminDAO.checkLogin(username, password));
		}
	}
}
