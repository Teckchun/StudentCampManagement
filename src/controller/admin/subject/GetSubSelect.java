package controller.admin.subject;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubjectDAO;
import model.dto.Subject;
import model.dto.SubjectSelection;

import com.google.gson.Gson;

/**
 * Servlet implementation class GetSubSelect
 */
@WebServlet("/GetSubSelect")
public class GetSubSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSubSelect() {
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
 		System.out.println("This is subject selection");
 		SubjectSelection subjects= SubjectDAO.getSubjectSelection(subselectid);
 		response.setContentType("application/json");
 		response.setCharacterEncoding("UTF-8");
 		String sendsubject= new Gson().toJson(subjects);
 		System.out.println(sendsubject);
 		response.getWriter().write(sendsubject);
 	}

}
