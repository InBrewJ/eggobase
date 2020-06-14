package assets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 * Servlet implementation class EggUploader
 */
public class EggUploader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EggUploader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		RequestContext ctx = new ServletRequestContext(request);
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			out.println("Nothing uploaded!");
			return;
		} else {
			FileItemFactory itemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(itemFactory);
			try {
				List<FileItem> items = upload.parseRequest(ctx);
				for (FileItem item : items) {
					out.println(item.getContentType());
					File uploadDir = new File("/home/inbrewj/workshop/local_assets/eggobase/img");
					File file = File.createTempFile("img", ".jpg", uploadDir);
					try {
						item.write(file);
						out.println("File written in ext Servlet!");
					} catch (Exception e) {
						out.println("Could not write file :( " + e);
					}
				}
			} catch (FileUploadException e) {
				out.println("Upload failed " + e);
			}
			request.getRequestDispatcher("/").forward(request, response);
		}
	}

}
