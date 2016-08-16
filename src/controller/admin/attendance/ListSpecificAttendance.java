package controller.admin.attendance;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdminDAO;
import model.dto.Attendent;

import com.google.gson.Gson;

/**
 * Servlet implementation class listSpecificAttendance
 */
@WebServlet("/listSpecificAttendance")
public class ListSpecificAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListSpecificAttendance() {
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
		String startdate=request.getParameter("startdate");
		String todate=request.getParameter("todate");
		String stuid=request.getParameter("id");
		
		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date( startdate);
		java.sql.Date sdate = new java.sql.Date(myDate.getTime());
		@SuppressWarnings("deprecation")
		java.util.Date myDate1 = new java.util.Date( todate);
		java.sql.Date tdate = new java.sql.Date(myDate1.getTime());
		
		ArrayList<Attendent> list = new AdminDAO().listSpecificAttendanceStudent(stuid, sdate, tdate);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendlist= new Gson().toJson(list);
		response.getWriter().write(sendlist);

		System.out.println(sendlist);
	}

}
