<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�޴� �κ�</title>
</head>
<body>
	<a href = "./main.jsp">Ȩ </a> �� 
	<%if(session.getAttribute("id")==null){ %>
		<a href = "./main.jsp?pagefile=list">��������</a>
<% }else { //������ �������� ���� ���
%>
	<a href = "./main.jsp?pagefile=list">������û</a>
<%} %>
</body>
</html>