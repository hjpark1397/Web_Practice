<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� �κ� 201704013 ������</title>
</head>
<body>
<%if(session.getAttribute("id")==null){ %>
<form action = "login_ok.jsp" method = "post">
���̵� <input type = "text" name = "id">
 ��й�ȣ <input type = "password" name = "pwd">
<input type = "submit" value = "�α���">
<a href = "./main.jsp?pagefile=join">
<input type = "button" value = "ȸ������">
</form>
<% }else { //������ �������� ���� ���
%>
<form action = "logout.jsp" method = "post">
<%= session.getAttribute("id") %>�� �α����ϼ̽��ϴ�.
<input type = "submit" value = "�α׾ƿ�">
</form>
<%} %>

</body>
</html>