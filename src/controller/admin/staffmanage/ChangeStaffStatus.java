package controller.admin.staffmanage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StaffDAO;

/**
 * Servlet implementation class ChangeStaffStatus
 */
@WebServlet("/ChangeStaffStatus")
public class ChangeStaffStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ChangeStaffStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=request.getParameter("id");
		int status=Integer.parseInt(request.getParameter("status"));
        
		if(new StaffDAO().changeStatus(id, status)){
			System.out.println("Change staff status success");
		}else{
			System.out.println("Change staff status failure");
		}
	}

}






































