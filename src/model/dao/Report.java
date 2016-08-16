package model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

public class Report {

	Connection con;
	public Report()
	{
		con=Utility.DBConnection.getConnect();
		
		
	}
	public void generateReport(HttpServletResponse response, Map<String , Object> param, String jrxmlPath ) throws JRException, SQLException, IOException
	{
		try {
			System.out.println(1);
			InputStream input= new FileInputStream(new File(jrxmlPath));
			System.out.println(2);
			JasperReport jasper=JasperCompileManager.compileReport(input);
			System.out.println(3);
			JasperPrint print=JasperFillManager.fillReport(jasper, param, con);
			System.out.println(5);
			JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
			System.out.println(6);
			
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			con.close();
			
		}
		
		
	}
	/*transcript*/
	public void generateTranscript(HttpServletResponse response, Map<String, Object> param, String jrxmlPath) throws Exception
	{
		try {
			System.out.println(1);
			InputStream input= new FileInputStream(new File(jrxmlPath));
			
			System.out.println(input);
			System.out.println(2);
			JasperReport jasper=JasperCompileManager.compileReport(input);
		
			System.out.println(3);
			JasperPrint print=JasperFillManager.fillReport(jasper, param, con);
			
			System.out.println(5);
			JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
			
			System.out.println(6);
			
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			
			
		}
	}
	/*studentlist*/
	public void generateStdlist(HttpServletResponse response, Map<String, Object> param, String jrxmlPath) throws Exception
	{
		try {
			System.out.println(1);
			InputStream input= new FileInputStream(new File(jrxmlPath));
			
			System.out.println(input);
			System.out.println(2);
			JasperReport jasper=JasperCompileManager.compileReport(input);
		
			System.out.println(3);
			JasperPrint print=JasperFillManager.fillReport(jasper, param, con);
			
			System.out.println(5);
			JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
			
			System.out.println(6);
			
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			
			
		}
	}
	
	/*filter list*/
	public void generateFilterlist(HttpServletResponse response, Map<String, Object> param, String jrxmlPath) throws Exception
	{
		try {
			System.out.println(1);
			InputStream input= new FileInputStream(new File(jrxmlPath));
			
			System.out.println(input);
			System.out.println(2);
			JasperReport jasper=JasperCompileManager.compileReport(input);
		
			System.out.println(3);
			JasperPrint print=JasperFillManager.fillReport(jasper, param, con);
			
			System.out.println(5);
			JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
			
			System.out.println(6);
			
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			
			
		}
	}
	/*monthlylist*/
	public void generateMonthlist(HttpServletResponse response, Map<String, Object> param, String jrxmlPath) throws Exception
	{
		try {
			System.out.println(1);
			InputStream input= new FileInputStream(new File(jrxmlPath));
			
			System.out.println(input);
			System.out.println(2);
			JasperReport jasper=JasperCompileManager.compileReport(input);
		
			System.out.println(3);
			JasperPrint print=JasperFillManager.fillReport(jasper, param, con);
			
			System.out.println(5);
			JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
			
			System.out.println(6);
			
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			
			
		}
	}
	/*all certificate*/
	public void generateAllcertificate(HttpServletResponse response, Map<String , Object> param, String jrxmlPath ) throws JRException, SQLException, IOException
	{
		try {
			System.out.println(1);
			InputStream input= new FileInputStream(new File(jrxmlPath));
			System.out.println(2);
			JasperReport jasper=JasperCompileManager.compileReport(input);
			System.out.println(3);
			JasperPrint print=JasperFillManager.fillReport(jasper, param, con);
			System.out.println(5);
			JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
			System.out.println(6);
			
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			con.close();
			
		}
		
		
	}
	

/*attendance list*/
public void generateattlist(HttpServletResponse response, Map<String, Object> param, String jrxmlPath) throws Exception
	{
		try {
			System.out.println(1);
			InputStream input= new FileInputStream(new File(jrxmlPath));
			
			System.out.println(input);
			System.out.println(2);
			JasperReport jasper=JasperCompileManager.compileReport(input);
		
			System.out.println(3);
			JasperPrint print=JasperFillManager.fillReport(jasper, param, con);
			
			System.out.println(5);
			JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
			
			System.out.println(6);
			
			
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			
			
		}
	}
	

	public static void main(String [] args)throws Exception
	{
		
		new Report().generateReport(null, null, "");
		new Report().generateTranscript(null, null, "");
		new Report().generateStdlist(null,null, "");
		new Report().generateAllcertificate(null, null, "");
		new Report().generateattlist(null,null, "");
	}
	
	
}
