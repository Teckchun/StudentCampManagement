package controller.admin.certificate;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RoomDAO;
import model.dao.StudentDAO;
import model.dto.Room;
import model.dto.Student;

import com.google.gson.Gson;

/**
 * Servlet implementation class ListallHRDstudent
 */
@WebServlet("/ListallHRDstudent")
public class ListallHRDstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListallHRDstudent() {
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
		
		String gen=request.getParameter("genid");
		String cou=request.getParameter("courseid");
		String cls=request.getParameter("classid");
		String sta=request.getParameter("status");
		System.out.println(sta);
		
		
		
		ArrayList<Student> student= StudentDAO.listAllHRDStudent(gen, cou, cls,sta);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String room=new Gson().toJson(student);
		response.getWriter().write(room);
		
		System.out.println(room);
	}

}
