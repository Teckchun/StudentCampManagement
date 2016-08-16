package controller.student;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.StudentDAO;

import com.google.gson.Gson;

/**
 * Servlet implementation class GetCourseEndDate
 */
@WebServlet("/GetCourseEndDate")
public class GetCourseEndDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCourseEndDate() {
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
		HttpSession stu=request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Object> s=(ArrayList<Object>) stu.getAttribute("student");
		String stuid=s.get(0).toString();
		
		int time=StudentDAO.checkCourseDate(stuid);
		boolean check=true;
		if(time>0){
			check=true;
		}else{
			check=false;
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String articlest= new Gson().toJson(check);
		
		response.getWriter().write(articlest);
	}


}
