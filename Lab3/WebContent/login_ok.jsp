<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>201704013 ������ �α��� üũ</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>

<% String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");

   if(id.equals("test")&&pwd.equals("1234"))
	   session.setAttribute("id", id);
   	   response.sendRedirect("main.jsp");//�α��� 

%>
</body>
</html>