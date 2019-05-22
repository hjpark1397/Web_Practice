<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>개설강좌 보여주는 페이지 201704013 박현주</title>
</head>
<body>

<%if(session.getAttribute("id")==null){ %>
<h2>개설강좌</h2>
<table border = "1" width = "400">
	<tr>
		<th>강좌코드</th><th>과목명</th><th>학년</th><th>학점</th>
	<tr>
	<tr><td>IC015-A</td><td>웹 시스템 설계 및 개발</td><td>3</td><td>3</td></tr>
	<tr><td>IC147-A</td><td>자바 기반 응용 프로그래밍</td><td>2</td><td>3</td></tr>
	<tr><td>IC136-A</td><td>컴퓨터 프로그래밍 기초</td><td>1</td><td>3</td></tr>
	<tr><td>IC066-A</td><td>운영체제</td><td>3</td><td>3</td></tr>
</table>
<% }else { //수강신청 탭은 선택할 수 있는 체크박스 필요
%>

 <form method = "post" action = "main.jsp?pagefile=apply">
<h2>수강신청하기</h2>
<table border = "1" width = "400">
	<tr>
		<th>강좌코드</th><th>과목명</th><th>학년</th><th>학점</th><th>선택</th>
	<tr>
	<tr>
	<td>IC015-A</td>
	<td><input type = "hidden" name = "lecture" value = "웹 시스템 설계 및 개발">웹 시스템 설계 및 개발</td>
	<td><input type = "hidden" name = "year" value = "3">3</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "1"></td></tr>
	<tr>
	<td>IC147-A</td>
	<td><input type = "hidden" name = "lecture" value = "자바 기반 응용 프로그래밍">자바 기반 응용 프로그래밍</td>
	<td><input type = "hidden" name = "year" value = "3">2</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "2"></td>
	</tr>
	<tr>
	<td>IC136-A</td>
	<td><input type = "hidden" name = "lecture" value = "컴퓨터 프로그래밍 기초">컴퓨터 프로그래밍 기초</td>
	<td><input type = "hidden" name = "year" value = "1">1</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "3"></td>
	</tr>
	<tr>
	<td>IC066-A</td>
	<td><input type = "hidden" name = "lecture" value = "운영체제">운영체제</td>
	<td><input type = "hidden" name = "year" value = "3">3</td>
	<td><input type = "hidden" name = "score" value = "3">3</td>
	<td><input type = "checkbox" name = "choose" value = "4"></td>
	</tr>
</table>
<input type = "submit" value = "수강신청">
</form>
<%} %>

</body>
</html>