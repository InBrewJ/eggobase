<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | Tell"></c:param>
</c:import>

<div class="ui container" style="min-height: 60vh">

	<p>Tell me about your egg?</p>

	<form action="/Eggobase/Controller" method="post">
		What color? <br /> <input type="hidden" name="action"
			value="submitNewEgg" /> <input type="text" name="color"
			value="<%=request.getAttribute("color")%>"> <br /> What is
		the egg's quality? <br /> <input type="number" name="quality"
			value="<%=request.getAttribute("quality")%>"> <br /> <input
			type="submit" value="Upload Egg">
	</form>

	<div>
		<h2>
			<%=request.getAttribute("message")%>
		</h2>
	</div>

</div>

<c:import url="footer.jsp"></c:import>