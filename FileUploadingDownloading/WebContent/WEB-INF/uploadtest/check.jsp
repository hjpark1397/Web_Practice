<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %> <!-- 인코딩 타입 설정 -->

<%
	String id = request.getParameter("id");
	String subject = request.getParameter("subject");
	String fileName1 = request.getParameter("fileName1");
	String fileName2 = request.getParameter("orgfileName1");
	String orgfileName1 = request.getParameter("orgfileName1");
	String orgfileName2 = request.getParameter("orgfileName2");
%>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8">
<title>업로드 한 파일을 확인하고 업로드 된 파일을 클릭하면 download.jsp로 이동한다</title>
</head>
<body>
	아이디 : <%=id %><br><br>
	제목 : <%=subject %><br><br>
	첨부파일(클릭 시 다운로드)<br><br>
	<!-- download.jsp 파일로 저장된 파일의 이름을 넘겨줌 -->
	- 파일1 : <a href = "download.jsp?fileName=<%=fileName1 %>"><%=orgfileName1 %></a><br><br>
	- 파일2 : <a href = "download.jsp?fileName=<%=fileName2 %>"><%=orgfileName2 %></a><br><br>
</body>
</html>