package controller.admin.staffmanage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.StaffDAO;
import model.dto.Staff;

/**
 * Servlet implementation class ListStaff
 */
@WebServlet("/ListStaff")
public class ListStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ListStaff() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Staff> staffs=new StaffDAO().getStaffInfo();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String staff=new Gson().toJson(staffs);
		response.getWriter().write(staff);
		
		System.out.println(staff);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
