package dbtest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class PostgresTestJDNI
 */
public class PostgresTestJDNI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostgresTestJDNI() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection conn;
		// Wildcards can be used here to avoid sql injection e.g.
//		String sql = "SELECT * FROM public.eggs where color=?";
		String sql = "SELECT * FROM public.eggs";
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			out.println("Cannot connect to local postgres" + e);
			return;
		}
		
		out.println("Blue Elephant + JNDI success!");
		out.println("------------------------------");
		
		PreparedStatement allEggs = null;
		try {
			allEggs = conn.prepareStatement(sql);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		try {
			rs = allEggs.executeQuery();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			if(!rs.isBeforeFirst()) {
				out.println("NO EGGOS");
			}
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		try {
			while (rs.next())
			{
			    out.println("This egg is " + rs.getString("quality"));
			    out.println("And it is " + rs.getString("color"));
			    out.println("~~~~~~~~");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			conn.close();
		} catch (SQLException e) {
			out.println("Cannot close pg connection!" + e);
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}



	@Override
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();
			Context env = (Context)initContext.lookup("java:comp/env");
			ds = (DataSource)env.lookup("jdbc/eggobase");
			 
		} catch (NamingException e) {
			throw new ServletException();
		}
	}


	

}
