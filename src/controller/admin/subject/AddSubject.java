package controller.admin.subject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubjectDAO;
import model.dto.Subject;

import com.google.gson.Gson;

/**
 * Servlet implementation class AddSubject
 */
@WebServlet("/AddSubject")
public class AddSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String subject=request.getParameter("subjectname");
		String createdate=request.getParameter("createdate");
		String subdescription=request.getParameter("subdescription");
		String subpercent=request.getParameter("subpercent");
		float subp=Float.parseFloat(subpercent);
	
		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date( createdate);
		java.sql.Date c_date = new java.sql.Date(myDate.getTime());
	
		Subject sub=new Subject();
		sub.setSubject_name(subject);
		sub.setCreat_date(c_date);
		sub.setDescription(subdescription);
		sub.setSub_percent(subp);
	//S	sub.setSubject_name();
		
		boolean status=new SubjectDAO().addSubject(sub);
		if(status){
			System.out.println("Saved");
		}else{
			System.out.println("Error Saving");
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		response.getWriter().write(sendstatus);
	}

}
