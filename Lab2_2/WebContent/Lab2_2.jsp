<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%><!-- �ڹٸ� ����ϱ� ���� ���(?) -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>201704013 ������</h2>
<%if(session.getAttribute("id")==null){%>
<form action = "Lab2_2_result.jsp" method="post">
���̵� <input type ="text" name="id">
<br>
��й�ȣ <input type="password" name="pwd"><br>
<input type = "submit" value="�α���">
</form>
<% }else {
%>
<form action="logout.jsp" method="post">
	<%=session.getAttribute("id") %>�� �α����ϼ̽��ϴ�.
	<input type="submit" value="�α׾ƿ�"><br><br>
</form>
<p> * �����ϴ� ������? </p><!--�������� -->
<form name = "form" id = "season" action="includepage.jsp" method="post">
<input type = "radio" name = "season" value = "spring">��
<input type = "radio" name = "season" value = "summer">����
<input type = "radio" name = "season" value = "autumn">����
<input type = "radio" name = "season" value = "winter">�ܿ�
<input type = "hidden" name = "id" value = "<%= session.getAttribute("id") %>">
<input type = "submit" value = "�������">
</form>

<%//�ð� ��¿� �ڹ��Լ�
	Date d = new Date();
	SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	long time =session.getLastAccessedTime();
	out.println("������ ���� �ð� : " + f.format(time)); 
%>



<%} %>


</body>
</html>