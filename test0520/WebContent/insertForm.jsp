<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������Form</title></head>
<body>
<form method="post" action="insertPro.jsp">
<table>
<tr>
<td>���̵�</td>
<td><input id="idt" name="idt" type="text" size="20"
maxlength="50" placeholder="example@naver.com" autofocus required>
<tr>
<td>��й�ȣ</td>
<td><input id="passwd" name="passwd" type="password"
size="20" placeholder="6~16�� ����/����" maxlength="16" required>
<tr>
<td>�̸�</td>
<td><input id="name" name="name" type="text" size="20"
maxlength="10" placeholder="ȫ�浿" required>
<tr>
<td>�ּ�</td>
<td class="content"><input id="addr" name="addr" type="text" size="20"
maxlength="100" placeholder="�����" required>
<tr>
<td>��ȭ��ȣ</td>
<td><input id="tel" name="tel" type="text" size="20"
maxlength="20" placeholder="010-1111-1111" required>
<tr>
<td colspan="2"><input type="submit" value="�Է¿Ϸ�">
<input type="reset" value="�ٽ��ۼ�">
</table>
</form>
</body>
</html>