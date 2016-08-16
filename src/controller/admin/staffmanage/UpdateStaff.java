package controller.admin.staffmanage;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StaffDAO;
import model.dto.Staff;

/**
 * Servlet implementation class UpdateStaff
 */
@WebServlet("/UpdateStaff")
public class UpdateStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateStaff() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String profile=request.getParameter("profile");
		String position=request.getParameter("position");
		
		Staff sf=new Staff();
		sf.setId(id);
		sf.setName(name);
		sf.setGender(gender);
		sf.setDob(new Date(dob));
		sf.setAddress(address);
		sf.setEmail(email);
		sf.setPhone(phone);
		sf.setProfile(profile);
		sf.setPosition(position);
		
		if(new StaffDAO().updateStaff(sf)){
			System.out.println("update staff ok");
		}else{
			System.out.println("update staff fialure");
		}
	}

}



















