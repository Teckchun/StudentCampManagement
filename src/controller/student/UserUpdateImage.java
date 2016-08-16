package controller.student;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.dao.StudentDAO;

import com.google.gson.Gson;
/**
 * Servlet implementation class UserUpdateImage
 */
@WebServlet("/UserUpdateImage")
public class UserUpdateImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateImage() {
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
		 String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("user/imguser");
		HttpSession stu=request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Object> s=(ArrayList<Object>) stu.getAttribute("student");
		String stuid=s.get(0).toString();
		//System.out.print(s.get(0).toString());
		if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        boolean updateimagestatus=StudentDAO.updateImageUser(stuid, name);
                        response.setContentType("application/json");
                		response.setCharacterEncoding("UTF-8");
                		String articlest= new Gson().toJson(updateimagestatus);
                		HttpSession session=request.getSession();
            			session.setAttribute("student", StudentDAO.refreshSession(stuid));
                		response.getWriter().write(articlest);
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
           
     
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
	}
	
}
