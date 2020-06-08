<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | Good Egg!"></c:param>
</c:import>

<div class="ui container">

	<h2>Egg received!</h2>
	<h3>
		<%=request.getAttribute("eggSuccess")%>
	</h3>

</div>

<c:import url="footer.jsp"></c:import>