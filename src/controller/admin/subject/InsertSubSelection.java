package controller.admin.subject;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.GenerationDAO;
import model.dao.SubjectDAO;
import model.dto.Generation;

import com.google.gson.Gson;

/**
 * Servlet implementation class InsertSubSelection
 */
@WebServlet("/InsertSubSelection")
public class InsertSubSelection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSubSelection() {
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
		
		
		String subject=request.getParameter("subject");
		int classlist=Integer.parseInt(request.getParameter("classlist"));
		String instructors=request.getParameter("instructors");
		boolean status = false;
		if(SubjectDAO.checkSubjectSelection(subject, classlist, instructors)==true){
			
			status=SubjectDAO.insertSubjectSelection(subject, classlist, instructors);
			if(status){
				System.out.println("Saved");
			}else{
				System.out.println("Error Saving");
			}
			System.out.print(status);
		}else{
			status=false;
		}
		System.out.print(status);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendstatus= new Gson().toJson(status);
		response.getWriter().write(sendstatus);
		
	}

}
