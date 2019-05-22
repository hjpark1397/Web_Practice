<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>홈페이지 메인 파일 201704013 박현주</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String pagefile=request.getParameter("pagefile");
		if(pagefile==null){
			pagefile = "intro";
		}
	%>
<jsp:forward page = "template.jsp">
<jsp:param name="pagefile" value="<%=pagefile%>"/>
</jsp:forward>
</body>
</html>