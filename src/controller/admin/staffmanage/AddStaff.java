package controller.admin.staffmanage;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.StaffDAO;
import model.dto.Staff;

/**
 * Servlet implementation class AddStaff
 */
@WebServlet("/AddStaff")
public class AddStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddStaff() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=new StaffDAO().getAutoId();
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String username=request.getParameter("name");
		String password=request.getParameter("phone");
		String dob=request.getParameter("dob");
		String address=request.getParameter("pob");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String profile=request.getParameter("profile");
		String position=request.getParameter("position");
		System.out.println(id);
		Staff sf=new Staff();
		sf.setId(id);
		sf.setName(name);
		sf.setGender(gender);
		sf.setUsername(username);
		sf.setPwd(password);
		sf.setDob(new Date(dob));
		sf.setAddress(address);
		sf.setEmail(email);
		sf.setPhone(phone);
		sf.setImagesrc("userimage.png");
		sf.setProfile(profile);
		sf.setBgimag("bg.jpg");
		sf.setPosition(position);
		
		boolean status=new StaffDAO().addStaff(sf);
		if(status==true){
			System.out.println("Saved Staff");
		}else{
			System.out.println("Save staff fialure");
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		response.getWriter().write(sendstatus);
		
	}

}



















