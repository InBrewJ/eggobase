<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<title>Eggobase &#129370;</title>
<%@ include file="includes.html"%>
</head>
<body>
	<%@ include file="header.html"%>
	<c:out value="Hello Eggjstl!"></c:out>
	<jsp:useBean id="testEggy" class="beans.BasicEgg" scope="page"></jsp:useBean>
	<p>
		<c:out value="${testEggy.info}" />
	</p>
	<p>
		Egg param :: <c:out value="${param.egg}"></c:out>
	</p>
	<%-- JSTL IF --%>
	<p>
		<c:if test="${param.egg == 'maud'}">
			MAUD IS HERE!
		</c:if>
	</p>
	<p>
		<c:if test="${param.egg != 'maud'}">
			MAUD IS GONE!
		</c:if>
	</p>
	<%-- JSTL CHOOSE --%>
	<p>
		<c:choose>
			<c:when test="${param.egg == 'andre'}">
				ANDRE THE GIANT, LOOK OUT
			</c:when>
			<c:otherwise>
				Don't worry, there are no giants	
			</c:otherwise>
		</c:choose>
	</p>
	<%-- JSTL Foreach --%>
	<%-- Can use EL directly without a c:out! --%>
	<c:forEach var="i" begin="${param.start}" end="${param.end}" step="1">
		<p>
			${i}
		</p>
	</c:forEach>
</body>
</html>