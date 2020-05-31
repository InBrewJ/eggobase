<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>Eggobase &#129370;</title>
<%@ include file="includes.html"%>
</head>
<body>

	<%@ include file="header.html"%>

	<!-- Declaration tag -->

	<%!private int totalEggs = 6;

	private String allOfTheEggs() {
		return "Here are " + totalEggs + " internet eggs";
	}

	private String getEggCookieColor(Cookie[] cookies) {
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("yourEggColor")) {
					return cookie.getValue();
				}
			}
		}
		return "Not set";
	}

	private String getEggCookieQuality(Cookie[] cookies) {
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("yourEggQuality")) {
					return cookie.getValue();
				}
			}
		}
		return "Not set";
	}%>

	<div class="ui text container">
		<h1 class="first">&#129370; &#129370; &#129370; Pure and simple,
			lots of eggs here &#129370; &#129370; &#129370;</h1>
		<p>
			Simply the best place to egg out | Over
			<%=getServletContext().getInitParameter("eggsRehomed")%>
			sent to great homes! | You join
			<%=getServletContext().getAttribute("hits")%>
			other egg lovers!
		</p>
	</div>

	<div style="margin: 2em 0em;" class="ui container">
		<div class="ui two column grid">
			<div class="column">
				<div class="ui two column grid">
					<div class="column">
						<h4>
							<%
								out.print(allOfTheEggs());
							%>
						</h4>
						<%
							for (int i = 0; i < totalEggs; ++i) {
						%>

						<p>
							<img src="https://source.unsplash.com/100x30/?eggs"
								alt="egg-img-<%=i%>" />
						</p>

						<%
							}
						%>
					</div>

					<div class="column">
						<!-- Must use a static include if there is Java code within -->
						<h3>Facts:</h3>

						<%@ include file="static_stuff.txt"%>
						<p />
						<jsp:include page="dynamic_stuff.txt" />
					</div>

				</div>


			</div>
			<div class="column">
				<div class="ui two column grid">
					<div class="column">
						<p>
							<a href="/Eggobase/egg-capability-form.jsp">Start egging</a>
						</p>
						<p>
							<a href="/Eggobase/egg-bean-form.jsp">Combine eggs with beans
								+ cookies</a>
						</p>
					</div>
					<div class="column">
						<p>
							<a href="/Eggobase/PostgresTest">Raw JDBC Eggobase</a>
						</p>
						<p>
							<a href="/Eggobase/PostgresTestJDNI">Less Raw JNDI Eggobase</a>
						</p>
						<p>
							<a href="/Eggobase/eggobase-admin.jsp">Eggobase Admin</a>
						</p>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="ui inverted vertical footer segment">
		<div class="ui center aligned container">
			<div class="ui centered mini image">Your &#129370;</div>
			<div class="ui inverted section divider"></div>
			<div class="ui horizontal inverted small divided link list">
				<div>
					Your egg is:
					<%=getEggCookieColor(request.getCookies())%>
				</div>
				<div>
					Your egg is of quality:
					<%=getEggCookieQuality(request.getCookies())%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>