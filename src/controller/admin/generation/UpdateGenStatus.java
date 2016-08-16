package controller.admin.generation;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.GenerationDAO;
import model.dto.Generation;

import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateGenStatus
 */
@WebServlet("/UpdateGenStatus")
public class UpdateGenStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGenStatus() {
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
		
		String generationid=request.getParameter("generationid");
		String genstatus=request.getParameter("genstatus");
		
		System.out.println(generationid+" "+genstatus);
		  int id=Integer.parseInt(generationid);
		  int gen=Integer.parseInt(genstatus);
		  boolean status=new GenerationDAO().changeGenerationStatus(id,gen);
	      if(status){
	    	  System.out.println("Change");
	      }else{
	    	  System.out.println("Error changing");
	      }
	      response.setContentType("application/json");
		 response.setCharacterEncoding("UTF-8");
			String statuss= new Gson().toJson(status);
			response.getWriter().write(statuss);
		/*ArrayList<Generation> generations = new GenerationDAO().getAllGeneration();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String generation= new Gson().toJson(generations);
		response.getWriter().write(generation);

		System.out.println(generation);*/
	}

}
