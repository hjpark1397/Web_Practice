<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import = "java.sql.Timestamp" %><!-- �ð� �޾ƿ��� -->
    <% request.setCharacterEncoding("euc-kr");//�ѱ� ���ڵ� %>
    <jsp:useBean id = "Lab4" class = "Lab4.Lab4" scope = "page">
    <jsp:setProperty name = "Lab4" property = "*"/>
    </jsp:useBean>
    <% Lab4.setDate(new Timestamp(System.currentTimeMillis())); %> <!-- �ð� -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	�ֹ���ȣ:
	<jsp:getProperty name = "Lab4" property = "order_num"/>
	<br>
	Ŀ�� :
	<jsp:getProperty name = "Lab4" property = "coffee"/>
	<br>
	�ɼ� : 
	<jsp:getProperty name = "Lab4" property = "option"/>
	<br>
	������ :
	<jsp:getProperty name = "Lab4" property = "size"/>
	<br>
	�ֹ��ð� : 
	<jsp:getProperty name = "Lab4" property = "date"/>
	<br>
	
</body>
</html>