package controller.admin.attendance;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.AdminDAO;
import model.dto.Attendent;

import com.google.gson.Gson;

/**
 * Servlet implementation class SelectAttendanceList
 */
@WebServlet("/SelectAttendanceList")
public class SelectAttendanceList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAttendanceList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO admin = new AdminDAO();
		String datef = request.getParameter("datef");
		
		@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date(datef);
		java.sql.Date c_date = new java.sql.Date(myDate.getTime());
		
	//	System.out.println(myDate);
		ArrayList<Attendent> attn = admin.select_attendancelist(c_date);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		String json = new Gson().toJson(attn);
		//System.out.print(json);
		response.getWriter().write(json);
		
	}

}
