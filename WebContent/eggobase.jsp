<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | Home of Egg"></c:param>
</c:import>

<%!private int totalEggs = 3;

	private String allOfTheEggs() {
		return "Here are " + totalEggs + " internet eggs";
	}%>

<div style="margin: 2em 0em; min-height: 60vh" class="ui container">
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
						<a href="/Eggobase/egg-basket.jsp">Look at eggs</a>
					</p>
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
<c:import url="footer.jsp"></c:import>
