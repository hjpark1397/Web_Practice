<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메뉴 부분</title>
</head>
<body>
	<a href = "./main.jsp">홈 </a> ㅣ 
	<%if(session.getAttribute("id")==null){ %>
		<a href = "./main.jsp?pagefile=list">개설강좌</a>
<% }else { //세션이 설정되지 않은 경우
%>
	<a href = "./main.jsp?pagefile=list">수강신청</a>
<%} %>
</body>
</html>