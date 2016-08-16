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
 * Servlet implementation class GetAttendantDetail
 */
@WebServlet("/GetAttendantDetail")
public class GetAttendantDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAttendantDetail() {
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
		String month=request.getParameter("month");
		String year=request.getParameter("year");
		
		
		ArrayList<Attendent> list = new AdminDAO().listAttendanceDetail(month, year);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String sendlist= new Gson().toJson(list);
		response.getWriter().write(sendlist);

		System.out.println(sendlist);
	}

}
