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

import com.google.gson.Gson;

/**
 * Servlet implementation class AdminPasswordSetting
 */
@WebServlet("/AdminPasswordSetting")
public class AdminPasswordSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPasswordSetting() {
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
		String admin=a.get(0).toString();
		String password=request.getParameter("adminpass");
		System.out.print(admin+" "+password);
		
		boolean status = AdminDAO.checkPassword(admin, password);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		
		response.getWriter().write(sendstatus);
	}

}
