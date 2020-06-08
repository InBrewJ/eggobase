<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>${param.headerTitle}</title>
<%@ include file="includes.html"%>
</head>
<body>

	<%@ include file="header.html"%>
	
	<div class="ui text container">
		<h1 class="first">&#129370; &#129370; &#129370; Pure and simple,
			lots of eggs here &#129370; &#129370; &#129370;</h1>
		<p>
			Simply the best place to egg out | Over
			<%=getServletContext().getInitParameter("eggsRehomed")%>
			sent to great homes! | You join
			<%=getServletContext().getAttribute("hits")%>
			other egg lovers!
		</p>
	</div>