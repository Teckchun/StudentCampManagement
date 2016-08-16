package controller.admin.addstudent;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StudentDAO;
import model.dto.Student;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public AddStudent() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String username=fname+lname;
		String pwd=request.getParameter("phone");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		String pob=request.getParameter("pob");
		String paddr=request.getParameter("padd");
		int course_id=Integer.parseInt(request.getParameter("course"));
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String faname=request.getParameter("faname");
		String faphone=request.getParameter("faphone");
		String moname=request.getParameter("moname");
		String mophone=request.getParameter("mophone");
		String parentsaddr=request.getParameter("pardd");
		String emergency=request.getParameter("emergency");
		String university=request.getParameter("university");
		String profile=request.getParameter("profile");
		String usersrc="userimage.png";
		int class_id=Integer.parseInt(request.getParameter("classname"));
		
		Student st=new Student();
		st.setStu_id(id);
		st.setFname(fname);
		st.setLname(lname);
		st.setUsername(username);
		st.setPwd(pwd);
		st.setGender(gender);
		st.setDob(new Date(dob));
		st.setPob(pob);
		st.setPaddr(paddr);
		st.setCourse_id(course_id);
		st.setPhone(phone);
		st.setEmail(email);
		st.setFa_name(faname);
		st.setFa_phone(faphone);
		st.setMo_name(moname);
		st.setMo_phone(mophone);
		st.setParents_addr(parentsaddr);
		st.setEmergency_contact(emergency);
		st.setUniversit(university);
		st.setProfiles(profile);
		st.setImg(usersrc);
		st.setBg_img("bg.jpg");
		
		try {
			if(new StudentDAO().addStudent(st, class_id)){
				System.out.println("Student saved");
			}else{
				System.out.println("Student save failured!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
