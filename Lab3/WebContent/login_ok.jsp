<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>201704013 박현주 로그인 체크</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>

<% String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");

   if(id.equals("test")&&pwd.equals("1234"))
	   session.setAttribute("id", id);
   	   response.sendRedirect("main.jsp");//로그인 

%>
</body>
</html>