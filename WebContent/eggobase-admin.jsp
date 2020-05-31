<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eggobase &#129370;</title>
<%@ include file="includes.html"%>
</head>
<body>

	<%@ include file="header.html"%>

	<div class="ui text container">
		<h1 class="first">&#129370; &#129370; &#129370; Danger Zone
			&#129370; &#129370; &#129370;</h1>
		<form action="/Eggobase/Controller" method="post">
			<input type="hidden" name="action" value="cleanEggobase" /> <input
				type="submit" value="Empty Basket">
		</form>
	</div>


</body>
</html>