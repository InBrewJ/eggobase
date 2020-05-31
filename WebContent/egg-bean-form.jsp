<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EggoBase | BeanEgg</title>
<%@ include file="includes.html"%>
</head>
<body>

<%@ include file="header.html"%>

<div class="ui container">

	<p>Tell me about your egg?</p> 

	<form action="/Eggobase/Controller" method="post">
		What color? <br /> 
		<input type="hidden" name="action" value="submitNewEgg" />
		<input type="text" name="color" value="<%= request.getAttribute("color")%>"> <br /> 
		What
		is the egg's quality? <br /> 
		<input type="number" name="quality" value="<%= request.getAttribute("quality")%>"> <br />
		<input type="submit" value="Upload Egg">
	</form>
	
	<div>
		<h2>
			<%= request.getAttribute("message")%>	
		</h2>
	</div>

</div>

</body>
</html>