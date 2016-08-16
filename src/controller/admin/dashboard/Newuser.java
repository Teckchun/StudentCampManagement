package controller.admin.dashboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdminDAO;
import model.dao.DashboardDAO;
import model.dto.Staff;

import com.google.gson.Gson;

/**
 * Servlet implementation class Newuser
 */
@WebServlet("/Newuser")
public class Newuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Newuser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<Staff> staff= new DashboardDAO().newStaff();
	
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String staffs= new Gson().toJson(staff);
		
		response.getWriter().write(staffs);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
