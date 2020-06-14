<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fcn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="eb"%>

<c:import url="header.jsp">
	<c:param name="headerTitle" value="&#129370 | This Egg"></c:param>
</c:import>

<div class="ui container" style="margin: 2em 0em; min-height: 60vh">

	<sql:setDataSource var="ds" dataSource="jdbc/eggobase" />
	<sql:query dataSource="${ds}"
		sql="SELECT * FROM public.eggs where id::varchar = ? LIMIT 1"
		var="results">
		<sql:param>${param.eggId}</sql:param>
	</sql:query>

	<c:set scope="page" var="egg" value="${results.rows[0]}"></c:set>

	<div class="ui card">
		<div class="content">
			<p>This egg is ${fcn:toUpperCase(egg.color)}</p>
		</div>
		<div class="image">
			<img src="https://source.unsplash.com/1600x900/?nature,${egg.color}"
				alt="egg-img-${egg.color}" />
		</div>
		<div class="content">
			<span class="left floated"> ${fcn:toUpperCase("emotive scene")}
			</span>
		</div>
	</div>

	<div class="ui card">
		<div class="content">
			<p>Quality: <fmt:formatNumber value="${egg.quality}" minFractionDigits="2"/></p>
		</div>
	</div>

</div>

<c:import url="footer.jsp"></c:import>