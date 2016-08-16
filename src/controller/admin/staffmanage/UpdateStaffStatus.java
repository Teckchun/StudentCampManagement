package controller.admin.staffmanage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StaffDAO;
import model.dao.StudentDAO;

import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateStaffStatus
 */
@WebServlet("/UpdateStaffStatus")
public class UpdateStaffStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStaffStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String staffid=request.getParameter("staffid");
		String staffstatus=request.getParameter("staffstatus");
		
		System.out.println(staffid+" "+staffstatus);
		
		  int sta=Integer.parseInt(staffstatus);
		  boolean status=new StaffDAO().changeStaffStatus(staffid, sta);
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
