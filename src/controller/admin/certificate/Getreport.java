package controller.admin.certificate;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
 * Servlet implementation class Getreport
 */
@WebServlet("/Getreport")
public class Getreport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getreport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Report report=new Report();
		String id=request.getParameter("id");
		String hour=request.getParameter("hour");
		System.out.print("This is report");
		String createdate=request.getParameter("date");
		Map<String , Object> param=new HashMap<String , Object>();
		String filepath=request.getServletContext().getRealPath("admin/view/certificate/");
		System.out.println(filepath);
		param.put("filepath",filepath);
		param.put("id", id);
		param.put("hour", hour);
		param.put("date", createdate);
		
		String jrxmlPath=request.getServletContext().getRealPath("admin/view/certificate/Certificate.jrxml");
		try {
			report.generateReport(response, param, jrxmlPath);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
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
