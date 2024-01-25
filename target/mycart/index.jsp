<%@page import="mycart.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ecart - Home</title>
<%@include file="components/bootstrap.jsp" %>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	<%@include file="components/message.jsp" %>
	<%
	User newUser=(User)session.getAttribute("loggedUser");
	
	%>
	<%if(newUser!=null){%>
	<h1>Welcome <%=newUser.getName()%></h1>
	<%} %>
</body>
</html>