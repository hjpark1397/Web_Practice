<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="ko">
<head>
<title>Lab2</title>
<meta charset="euc-kr">
<style>
#container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#header {
	padding: 20px;
	margin-bottom: 5px;
	width: 900px;
	height: 10px;
	border: 1px solid #bcbcbc;
	float: right;
	text-align: right;
}

#headermenu {
	padding: 20px;
	margin-bottom: 5px;
	width: 900px;
	height: 50px;
	float: left;
	border: 1px solid #bcbcbc;
}

#content {
	width: 900px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc;
}

#footer {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
</style>
</head>
<%
String pagefile=request.getParameter("pagefile");
%>
<body>
	<div id="container">
		<!-- header 시작  -->
		<p><div id="header">
			<jsp:include page="header.jsp" flush="false"/>
		</p>
		</div>
		
		<div id="headermenu">
			<jsp:include page="menu.jsp"/>
		</div>

		<!-- header 끝  -->
		<!--  content 시작  -->
		<div id="content">
			<jsp:include page='<%=pagefile+".jsp"%>'/> <!-- 페이지가 계속 바뀌기 때문에 걸어줘야하는 부분 -->

		</div>
		<!--  content 끝  -->

		<!--  footer 시작   -->
		<div id="footer">
			<p><jsp:include page="footer.jsp"/></p>
		</div>
		<!--  footer 끝  -->

	</div>

</body>
</html>