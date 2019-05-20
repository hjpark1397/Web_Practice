<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입Form</title></head>
<body>
<form method="post" action="insertPro.jsp">
<table>
<tr>
<td>아이디</td>
<td><input id="idt" name="idt" type="text" size="20"
maxlength="50" placeholder="example@naver.com" autofocus required>
<tr>
<td>비밀번호</td>
<td><input id="passwd" name="passwd" type="password"
size="20" placeholder="6~16자 숫자/문자" maxlength="16" required>
<tr>
<td>이름</td>
<td><input id="name" name="name" type="text" size="20"
maxlength="10" placeholder="홍길동" required>
<tr>
<td>주소</td>
<td class="content"><input id="addr" name="addr" type="text" size="20"
maxlength="100" placeholder="서울시" required>
<tr>
<td>전화번호</td>
<td><input id="tel" name="tel" type="text" size="20"
maxlength="20" placeholder="010-1111-1111" required>
<tr>
<td colspan="2"><input type="submit" value="입력완료">
<input type="reset" value="다시작성">
</table>
</form>
</body>
</html>