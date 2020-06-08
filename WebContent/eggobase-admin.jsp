<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | EGG CRACKING ZONE!"></c:param>
</c:import>

	<div class="ui text container">
		<h1 class="first">&#9888; &#9888; &#9888; Danger Zone
			&#9888; &#9888; &#9888;</h1>
		<form action="/Eggobase/Controller" method="post">
			<input type="hidden" name="action" value="cleanEggobase" /> <input
				type="submit" value="Empty Basket">
		</form>
	</div>

<c:import url="footer.jsp"></c:import>
