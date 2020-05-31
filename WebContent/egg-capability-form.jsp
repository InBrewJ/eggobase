<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Egg Capability</title>
<%@ include file="includes.html"%>
</head>
<body>

	<%@ include file="header.html"%>

	<div class="ui container">

		<h3>How many eggs can you handle?</h3>

		<form action="/Eggobase/Controller" method="post">
			<input type="hidden" name="action" value="submitEggConfidence">
			<input type="text" name="numEggsCanHandle"></input> <input
				type="submit" value="OK">
		</form>

	</div>


</body>
</html>