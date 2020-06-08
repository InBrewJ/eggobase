<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | How do you egg?"></c:param>
</c:import>

<div class="ui container" style="min-height: 60vh">

	<h3>How many eggs can you handle?</h3>

	<form action="/Eggobase/Controller" method="post">
		<input type="hidden" name="action" value="submitEggConfidence">
		<input type="text" name="numEggsCanHandle"></input> <input
			type="submit" value="OK">
	</form>

</div>
<c:import url="footer.jsp"></c:import>