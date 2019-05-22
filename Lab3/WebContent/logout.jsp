<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>201704013 박현주 로그아웃</title>
</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("main.jsp");
%>
</body>
</html>