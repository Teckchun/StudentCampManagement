package controller.student.transcript;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.Report;

import net.sf.jasperreports.engine.JRException;

/**
 * Servlet implementation class Gettranscript
 */
@WebServlet("/Gettranscript")
public class Gettranscript extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Gettranscript() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Report report=new Report();
		String id=request.getParameter("id");
		Map<String , Object> param=new HashMap<String , Object>();
		String filepath=request.getServletContext().getRealPath("user/transcript/");
		String imgpath=request.getServletContext().getRealPath("/imgprofiles");
		System.out.println(filepath);
		param.put("filepath",filepath);
		param.put("id",id);
		param.put("realpath",imgpath+"\\");
	
		
	
		
		String jrxmlPath=request.getServletContext().getRealPath("user/transcript/Transcript.jrxml");
		
		try {
			
		
			report.generateTranscript(response, param, jrxmlPath);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
