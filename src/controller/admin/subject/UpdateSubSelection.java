package controller.admin.subject;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubjectDAO;

import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateSubSelection
 */
@WebServlet("/UpdateSubSelection")
public class UpdateSubSelection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSubSelection() {
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
		
		
		int subselectid=Integer.parseInt(request.getParameter("subselectid"));
		String subject=request.getParameter("subject");
		int classlist=Integer.parseInt(request.getParameter("classlist"));
		String instructors=request.getParameter("instructors");
	
		boolean status = false;
		if(SubjectDAO.checkSubjectSelection(subject, classlist, instructors)==true){
			status=SubjectDAO.updateSubSelection(subject, classlist, instructors, subselectid);
			if(status){
				System.out.println("updated");
			}else{
				System.out.println("Error updating");
			}
			System.out.print(status);
		}else{
			status=false;
		}
		System.err.print(status);
	
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		response.getWriter().write(sendstatus);
	}

}
