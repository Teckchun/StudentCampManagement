package controller.admin.subject;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubjectDAO;
import model.dto.Subject;

import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateSubject
 */
@WebServlet("/UpdateSubject")
public class UpdateSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSubject() {
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
		
		
		String subjectid=request.getParameter("subjectid");
		String subject=request.getParameter("subjectname");
		String createdate=request.getParameter("createdate");
		String subdescription=request.getParameter("subdescription");
		String subpercent=request.getParameter("subpercent");
	
		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date( createdate);
		java.sql.Date c_date = new java.sql.Date(myDate.getTime());
		float subper=Float.parseFloat(subpercent);
		Subject sub=new Subject();
		sub.setSubject_id(subjectid);
		sub.setSubject_name(subject);
		sub.setCreat_date(c_date);
		sub.setSub_percent(subper);
		sub.setDescription(subdescription);
		
		boolean status=SubjectDAO.updateSubject(sub);
		if(status){
			System.out.println("updated");
		}else{
			System.out.println("Error updating");
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		response.getWriter().write(sendstatus);
	}

}
