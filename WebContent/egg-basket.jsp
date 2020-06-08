<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | Home"></c:param>
</c:import>


<div class="ui container">
	<sql:setDataSource var="ds" dataSource="jdbc/eggobase"/>
	<sql:query dataSource="${ds}" sql="SELECT * FROM public.eggs" var="results"/>
	<c:forEach var="egg" items="${results.rows}">
		<p>This egg is ${egg.color}</p>
		<p>And it is a solid ${egg.quality}</p>
		<p>~~~~~~~~~~~~~~~~~~~~~~~~~</p>		
	</c:forEach>
</div>

<c:import url="footer.jsp"></c:import>