<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%><!-- 자바를 사용하기 위한 헤더(?) -->
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>201704013 박현주</h2>
<%if(session.getAttribute("id")==null){%>
<form action = "Lab2_2_result.jsp" method="post">
아이디 <input type ="text" name="id">
<br>
비밀번호 <input type="password" name="pwd"><br>
<input type = "submit" value="로그인">
</form>
<% }else {
%>
<form action="logout.jsp" method="post">
	<%=session.getAttribute("id") %>님 로그인하셨습니다.
	<input type="submit" value="로그아웃"><br><br>
</form>
<p> * 좋아하는 계절은? </p><!--계절선택 -->
<form name = "form" id = "season" action="includepage.jsp" method="post">
<input type = "radio" name = "season" value = "spring">봄
<input type = "radio" name = "season" value = "summer">여름
<input type = "radio" name = "season" value = "autumn">가을
<input type = "radio" name = "season" value = "winter">겨울
<input type = "hidden" name = "id" value = "<%= session.getAttribute("id") %>">
<input type = "submit" value = "결과보기">
</form>

<%//시간 출력용 자바함수
	Date d = new Date();
	SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	long time =session.getLastAccessedTime();
	out.println("마지막 접속 시간 : " + f.format(time)); 
%>



<%} %>


</body>
</html>