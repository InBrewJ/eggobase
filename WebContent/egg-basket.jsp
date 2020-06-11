<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | Home"></c:param>
</c:import>


<div class="ui container" style="margin: 2em 0em; min-height: 60vh">
	<sql:setDataSource var="ds" dataSource="jdbc/eggobase" />
	<sql:query dataSource="${ds}" sql="SELECT * FROM public.eggs"
		var="results" />
	<c:forEach var="egg" items="${results.rows}">
		<div class="ui card">
			<div class="content">
				<p>This egg is ${egg.color}</p>
			</div>
			<div class="image">
				<img>
			</div>
			<div class="content">
				<span class="left floated"> And it is a solid ${egg.quality}
				</span>
			</div>
			<div class="extra content">
				<div class="ui large transparent left icon input">
					<a
						href="<c:url value='/Controller?action=enterShell&eggId=${egg.id}' />">
						Enter shell </a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<c:import url="footer.jsp"></c:import>