package dbtest;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PostgresTest
 */
public class PostgresTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostgresTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection conn = null;
		
//		Remember - copy the postgres jar into tomcat/lib too!
		
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			out.println("Cannot find Postgres driver JAR");
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eggobase", "postgres", "docker");
		} catch (SQLException e) {
			out.println("Cannot connect to local postgres" + e);
			return;
		}
		
		out.println("Connected to the blue elephant");
		out.println("------------------------------");
		
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = st.executeQuery("SELECT * FROM public.eggs");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			out.println("Cannot run statement: " + e1);
		}
		
		try {
			while (rs.next())
			{
			    out.println("This egg is " + rs.getString(rs.findColumn("quality")));
			    out.println("And it is " + rs.getString(rs.findColumn("color")));
			    out.println("~~~~~~~~");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			conn.close();
		} catch (SQLException e) {
			out.println("Could not close postgres connection!");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
