package controller.message;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadImageInfo
 */
@WebServlet("/UploadImageInfo")
public class UploadImageInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadImageInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("imageinfo");
		if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        response.setContentType("application/json");
                		response.setCharacterEncoding("UTF-8");
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
            } catch (Exception ex) {
             System.out.println("File Upload Failed due to " + ex);
            }          
         
        }else{
            System.out.println("Sorry this Servlet only handles file upload request");
        }
	}

	}
