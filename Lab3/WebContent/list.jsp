<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� �����ִ� ������ 201704013 ������</title>
</head>
<body>

<%if(session.getAttribute("id")==null){ %>
<h2>��������</h2>
<table border = "1" width = "400">
	<tr>
		<th>�����ڵ�</th><th>�����</th><th>�г�</th><th>����</th>
	<tr>
	<tr><td>IC015-A</td><td>�� �ý��� ���� �� ����</td><td>3</td><td>3</td></tr>
	<tr><td>IC147-A</td><td>�ڹ� ��� ���� ���α׷���</td><td>2</td><td>3</td></tr>
	<tr><td>IC136-A</td><td>��ǻ�� ���α׷��� ����</td><td>1</td><td>3</td></tr>
	<tr><td>IC066-A</td><td>�ü��</td><td>3</td><td>3</td></tr>
</table>
<% }else { //������û ���� ������ �� �ִ� üũ�ڽ� �ʿ�
%>

 <form method = "post" action = "main.jsp?pagefile=apply">
<h2>������û�ϱ�</h2>
<table border = "1" width = "400">
	<tr>
		<th>�����ڵ�</th><th>�����</th><th>�г�</th><th>����</th><th>����</th>
	<tr>
	<tr>
	<td>IC015-A</td>
	<td><input type = "hidden" name = "lecture" value = "�� �ý��� ���� �� ����">�� �ý��� ���� �� ����</td>
	<td><input type = "hidden" name = "year" value = "3">3</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "1"></td></tr>
	<tr>
	<td>IC147-A</td>
	<td><input type = "hidden" name = "lecture" value = "�ڹ� ��� ���� ���α׷���">�ڹ� ��� ���� ���α׷���</td>
	<td><input type = "hidden" name = "year" value = "3">2</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "2"></td>
	</tr>
	<tr>
	<td>IC136-A</td>
	<td><input type = "hidden" name = "lecture" value = "��ǻ�� ���α׷��� ����">��ǻ�� ���α׷��� ����</td>
	<td><input type = "hidden" name = "year" value = "1">1</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "3"></td>
	</tr>
	<tr>
	<td>IC066-A</td>
	<td><input type = "hidden" name = "lecture" value = "�ü��">�ü��</td>
	<td><input type = "hidden" name = "year" value = "3">3</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "4"></td>
	</tr>
</table>
<input type = "submit" value = "������û">
</form>
<%} %>

</body>
</html>