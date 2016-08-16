package controller.admin.attendance;

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
 * Servlet implementation class GetattList
 */
@WebServlet("/GetattList")
public class GetattList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetattList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Report report=new Report();
		String month=request.getParameter("month");
		String year=request.getParameter("year");
		
		System.out.print("This is report");
		/*@SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date( start);
		java.sql.Date sdate = new java.sql.Date(myDate.getTime());
		@SuppressWarnings("deprecation")
		java.util.Date myDate1 = new java.util.Date( end);
		java.sql.Date tdate = new java.sql.Date(myDate1.getTime());
		*/
		Map<String , Object> param=new HashMap<String , Object>();
		String filepath=request.getServletContext().getRealPath("admin/view/attendancelist/");
		String realpath=request.getServletContext().getRealPath("admin/view/attendancelist/");
		System.out.println(filepath);
		System.out.println(realpath);
		param.put("filepath",filepath);
		param.put("realpath",realpath);
		param.put("month", month);
		param.put("year",year);
	
		
		String jrxmlPath=request.getServletContext().getRealPath("admin/view/attendancelist/attlist.jrxml");
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
		doGet(request, response);
	}

}
