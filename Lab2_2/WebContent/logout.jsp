<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Logout</title>
</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("Lab2_2.jsp");
%>
</body>
</html>