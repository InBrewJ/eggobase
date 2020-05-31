<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A New Egg is born! &#129370;</title>
<%@ include file="includes.html"%>
</head>
<body>

	<%@ include file="header.html"%>

	<div class="ui container">

		<h2>Egg received!</h2>
		<h3>
			<%= request.getAttribute("eggSuccess")%>
		</h3>	

	</div>

</body>
</html>