<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������û�ϴ� �� ����� 201704013 ������</title>
</head>
<body>
	<!--  form method = "post" action = "main.jsp?pagefile=apply"-->
<h2>������û�ϱ�</h2>
<table border = "1" width = "400">
<%
String[] lecture = request.getParameterValues("lecture");//������ �����
String[] year = request.getParameterValues("year");//�г��
String[] choose = request.getParameterValues("choose");//���� ����(���� �� �κ�)
String[] score = request.getParameterValues("score");//����(���߿� �ջ�)
int count = 0;//��ȣ

%>
	<tr>
		<th>��ȣ</th><th>������ ����</th><th>����</th><th>�г�</th>
	</tr>
	<% for(int i=0; choose.length>i ;i++){ 
		count+=Integer.parseInt(score[i]);//ī��Ʈ ���� ���ھ� �������Ѥ� ������ش�
	%>
	<tr>
		<td>
		<%out.print(i+1);//���� ��ȣ%>
		</td>
		<td>
		<%out.print(lecture[i]);//���Ǹ�%>
		</td>
		<td>
		<%out.print(score[i]);//����%>����
		</td>
		<td>
		<%out.print(year[i]);//�г�%>�г�
		</td>
	<%} %>
	</tr>
	<tr>
		<td colspan ="3"><td>�� ����</td>
		<td style = "color:red" align = "right"><%out.print(count); %></td>
	</tr>
</table>

<a href = "./main.jsp?pagefile=result">
<input type = "button" value = "��û">
</a>
</form>
</body>
</html>