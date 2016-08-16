package controller.admin.attendance;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdminDAO;

/**
 * Servlet implementation class DeleteAttendance
 */
@WebServlet("/DeleteAttendance")
public class DeleteAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAttendance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO admin = new AdminDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		boolean status = admin.delete_attendance(id);
		if(status){
			System.out.println("DELETE SUCCESS");
		}else{
			System.out.println("DELETE FAILED");
		}
		
	}

}
