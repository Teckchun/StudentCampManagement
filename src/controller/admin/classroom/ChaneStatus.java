package controller.admin.classroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RoomDAO;

/**
 * Servlet implementation class ChaneStatus
 */
@WebServlet("/ChaneStatus")
public class ChaneStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChaneStatus() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		int status=Integer.parseInt(request.getParameter("status"));
		
		if(new RoomDAO().changeClassStatus(id, status)){
			System.out.println("Status updated");
		}else{
			System.out.println("update status fialure");
		}
	}

}
