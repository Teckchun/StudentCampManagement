package controller.admin.generation;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dao.GenerationDAO;
import model.dto.Generation;

/**
 * Servlet implementation class AddGeneration
 */
@WebServlet("/AddGeneration")
public class AddGeneration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGeneration() {
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
		
		String name=request.getParameter("generationname");
		String orient_date=request.getParameter("orientation");
		String finish_date=request.getParameter("finish");
		String description=request.getParameter("gendescription");

		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date( orient_date);
		java.sql.Date orientdate = new java.sql.Date(myDate.getTime());
		@SuppressWarnings("deprecation")
		java.util.Date myDate1 = new java.util.Date( finish_date);
		java.sql.Date finishdate = new java.sql.Date(myDate1.getTime());
		Generation gn=new Generation(name,orientdate,finishdate,description);
		boolean status=new GenerationDAO().insertGeneration(gn);
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
