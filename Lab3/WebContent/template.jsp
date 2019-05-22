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
		<!-- header ����  -->
		<p><div id="header">
			<jsp:include page="header.jsp" flush="false"/>
		</p>
		</div>
		
		<div id="headermenu">
			<jsp:include page="menu.jsp"/>
		</div>

		<!-- header ��  -->
		<!--  content ����  -->
		<div id="content">
			<jsp:include page='<%=pagefile+".jsp"%>'/> <!-- �������� ��� �ٲ�� ������ �ɾ�����ϴ� �κ� -->

		</div>
		<!--  content ��  -->

		<!--  footer ����   -->
		<div id="footer">
			<p><jsp:include page="footer.jsp"/></p>
		</div>
		<!--  footer ��  -->

	</div>

</body>
</html>