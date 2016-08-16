package controller.admin.classroom;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.RoomDAO;
import model.dto.Room;

import com.google.gson.Gson;

/**
 * Servlet implementation class ListClassCombo
 */
@WebServlet("/ListClassCombo")
public class ListClassCombo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListClassCombo() {
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
		
		String course=request.getParameter("course");
		String generation=request.getParameter("gen");
		
		
		ArrayList<Room> rooms=new RoomDAO().getClassCombo(course,generation);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String room=new Gson().toJson(rooms);
		response.getWriter().write(room);
		
		System.out.println(room);
	}


}
