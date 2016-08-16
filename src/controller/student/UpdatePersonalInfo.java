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
import model.dto.Student;

import com.google.gson.Gson;

/**
 * Servlet implementation class UpdatePersonalInfo
 */
@WebServlet("/UpdatePersonalInfo")
public class UpdatePersonalInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePersonalInfo() {
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
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		String pob=request.getParameter("pob");
		String permadd=request.getParameter("permadd");
		String stuphone=request.getParameter("stuphone");
		String memail=request.getParameter("stuemail");
		String fathername=request.getParameter("fathername");
		String fatherphone=request.getParameter("fatherphone");
		String mothername=request.getParameter("mothername");
		String motherphone=request.getParameter("motherphone");
		String parentaddress=request.getParameter("parentaddress");
		String emergencyphone =request.getParameter("emergencyphone");
		
		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(gender);
		System.out.println(dob);
		System.out.println(pob);
		System.out.println(permadd);
		System.out.println(stuphone);
		System.out.println(memail);
		System.out.println(fathername);
		System.out.println(fatherphone);
		System.out.println(mothername);
		System.out.println(motherphone);
		System.out.println(parentaddress);
		System.out.println(emergencyphone);
		
	
		
		Student student=new Student();
		student.setFname(firstname);
		student.setLname(lastname);
		student.setGender(gender);
		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date(dob);
		java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
		student.setDob(sqlDate);
		student.setPob(pob);
		student.setPaddr(permadd);
		student.setPhone(stuphone);
		student.setEmail(memail);
		student.setFa_name(fathername);
		student.setFa_phone(fatherphone);
		student.setMo_name(mothername);
		student.setMo_phone(motherphone);
		student.setParents_addr(parentaddress);
		student.setEmergency_contact(emergencyphone);
		student.setStu_id(stuid);
		
		boolean status = StudentDAO.updateStudentInfo(student);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		
		response.getWriter().write(sendstatus);
	}

}
