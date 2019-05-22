<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청하는 탭 만들기 201704013 박현주</title>
</head>
<body>
	<!--  form method = "post" action = "main.jsp?pagefile=apply"-->
<h2>수강신청하기</h2>
<table border = "1" width = "400">
<%
String[] lecture = request.getParameterValues("lecture");//선택한 과목들
String[] year = request.getParameterValues("year");//학년들
String[] choose = request.getParameterValues("choose");//선택 유무(선택 된 부분)
String[] score = request.getParameterValues("score");//점수(나중에 합산)
int count = 0;//번호

%>
	<tr>
		<th>번호</th><th>선택한 과목</th><th>학점</th><th>학년</th>
	</tr>
	<% for(int i=0; choose.length>i ;i++){ 
		count+=Integer.parseInt(score[i]);//카운트 값에 스코어 총점으ㅡㄹ 계산해준다
	%>
	<tr>
		<td>
		<%out.print(i+1);//순서 번호%>
		</td>
		<td>
		<%out.print(lecture[i]);//강의명%>
		</td>
		<td>
		<%out.print(score[i]);//학점%>학점
		</td>
		<td>
		<%out.print(year[i]);//학년%>학년
		</td>
	<%} %>
	</tr>
	<tr>
		<td colspan ="3"><td>총 학점</td>
		<td style = "color:red" align = "right"><%out.print(count); %></td>
	</tr>
</table>

<a href = "./main.jsp?pagefile=result">
<input type = "button" value = "신청">
</a>
</form>
</body>
</html>