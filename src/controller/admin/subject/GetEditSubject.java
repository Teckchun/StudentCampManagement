package controller.admin.subject;

import java.io.IOException;
import java.sql.SQLException;

import javax.security.auth.Subject;
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
 * Servlet implementation class GetEditSubject
 */
@WebServlet("/GetEditSubject")
public class GetEditSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEditSubject() {
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
		
		String id=request.getParameter("subjectid");
		System.out.print(id);
		model.dto.Subject subject=SubjectDAO.getEditSubject(id);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendsubject=new Gson().toJson(subject);
		response.getWriter().write(sendsubject);
		
		System.out.println(sendsubject);
	}

}
