package controller.admin.staffmanage;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.StaffDAO;
import model.dto.Staff;

/**
 * Servlet implementation class GetStaff
 */
@WebServlet("/GetStaff")
public class GetStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public GetStaff() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		
		Staff staff=new StaffDAO().getStaff(id);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String sf=new Gson().toJson(staff);
		response.getWriter().write(sf);
		
		System.out.println(sf);	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
