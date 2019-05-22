<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 부분 201704013 박현주</title>
</head>
<body>
<%if(session.getAttribute("id")==null){ %>
<form action = "login_ok.jsp" method = "post">
아이디 <input type = "text" name = "id">
 비밀번호 <input type = "password" name = "pwd">
<input type = "submit" value = "로그인">
<a href = "./main.jsp?pagefile=join">
<input type = "button" value = "회원가입">
</form>
<% }else { //세션이 설정되지 않은 경우
%>
<form action = "logout.jsp" method = "post">
<%= session.getAttribute("id") %>님 로그인하셨습니다.
<input type = "submit" value = "로그아웃">
</form>
<%} %>

</body>
</html>