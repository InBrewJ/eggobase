package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import beans.BasicEgg;
import models.EggBasket;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;
	private EggBasket eggBasket = new EggBasket();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			InitialContext initContext = new InitialContext();
			Context env = (Context) initContext.lookup("java:comp/env");
			ds = (DataSource) env.lookup("jdbc/eggobase");

		} catch (NamingException e) {
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext context = getServletContext();
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		Integer hits = (Integer) context.getAttribute("hits");

		if (hits == null) {
			hits = 0;
		} else {
			hits++;
		}

		context.setAttribute("hits", hits);

		if (action == null)
			action = "default";

		switch (action) {
		case "submitNewEgg":
			request.getRequestDispatcher("/Eggobase/EggDetails.jsp").forward(request, response);
			break;
		case "submitEggConfidence":
			out.println("You can handle " + request.getParameter("numEggsCanHandle") + " eggs");
			break;
		default:
			request.getRequestDispatcher("/").forward(request, response);
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();
		Connection conn = null;

		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			out.println("Cannot connect to local postgres" + e);
			return;
		}

		if (action == null) {

		} else {

			switch (action) {

			case "submitNewEgg":
				String color = request.getParameter("color");
				String originalQuality = request.getParameter("quality");
				int quality = Integer.parseInt(originalQuality);
				BasicEgg requestEgg = new BasicEgg(color, quality);

				request.setAttribute("color", color);
				request.setAttribute("quality", request.getParameter("quality"));
				Cookie cookieColor = new Cookie("yourEggColor", color);
				Cookie cookieQuality = new Cookie("yourEggQuality", originalQuality);
				cookieColor.setMaxAge(1800);
				cookieQuality.setMaxAge(1800);

				if (requestEgg.validate()) {
					response.addCookie(cookieColor);
					response.addCookie(cookieQuality);
					try {
						boolean eggSuccess = eggBasket.add(conn, requestEgg);
						if (eggSuccess)
							request.setAttribute("eggSuccess", "true");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						request.setAttribute("eggSuccess", "false");
					}
					request.getRequestDispatcher("/egg-details.jsp").forward(request, response);
				} else {
					request.setAttribute("message", requestEgg.getMessage());
					request.getRequestDispatcher("/egg-bean-form.jsp").forward(request, response);
				}
				break;
			case "cleanEggobase":
				try {
					boolean cleanSuccess = eggBasket.clean(conn);
					if (cleanSuccess)
						request.getRequestDispatcher("/PostgresTestJDNI").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "submitEggConfidence":
				out.println("You can handle " + request.getParameter("numEggsCanHandle") + " eggs");
				break;
			default:
				request.getRequestDispatcher("/").forward(request, response);
				break;
			}
		}

		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
