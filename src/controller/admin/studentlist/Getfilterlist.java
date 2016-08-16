package controller.admin.studentlist;

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
 * Servlet implementation class Getfilterlist
 */
@WebServlet("/Getfilterlist")
public class Getfilterlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getfilterlist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Report report=new Report();
		String generation=request.getParameter("generation");
		generation=(generation.equalsIgnoreCase(""))?"%":generation;
		String course=request.getParameter("course");
		course=(course.equalsIgnoreCase(""))?"%":course;
		String classs=request.getParameter("class");
		classs=(classs.equalsIgnoreCase(""))?"%":classs;
		String status=request.getParameter("status");
		status=(status.equalsIgnoreCase(""))?"%":status;
		System.out.println(generation + course + classs);
		
		Map<String , Object> param=new HashMap<String , Object>();
		String filepath=request.getServletContext().getRealPath("admin/view/studentlist/");
		
		System.out.println(filepath);
		param.put("filepath",filepath);
		param.put("generation",generation);
		param.put("course", course);
		param.put("class", classs);
		param.put("status", status);
		
	
		
	
		
		String jrxmlPath=request.getServletContext().getRealPath("admin/view/studentlist/filterlist.jrxml");
		
		try {
			
		
			report.generateStdlist(response, param, jrxmlPath);
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
