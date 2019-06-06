<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import = "notice.NoticeDAO" %>
 <!-- NoticeDAO.java Class -->
   
 <%@page import = "java.io.PrintWriter" %>
 <!-- java Class -->
 
 <%@page import = "file.FileDAO" %>
 <%@page import = "java.io.File" %>
 <%@page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
 <%@page import = "com.oreilly.servlet.MultipartRequest" %>
 <!-- 이건 파일 입출력을 위해서 쓰는건데 과연 성공을 할 수 있을지는 잘 모르겠다고 한다. -->
 

 <%
 request.setCharacterEncoding("UTF-8");
 response.setContentType("text/html; charset=UTF-8");//set으로 쓰는 습관들이기
 %>
 
<!-- 한명의 회원정보를 담는 user클래스를 자바빈즈로 사용 / scope : 페이지. 현재의 페이지에서만 사용 --> 
<jsp:useBean id = "notice" class = "notice.Notice" scope = "page"/>
<!-- Bbs bbs = new Bbs(); -->
<jsp:setProperty name = "notice" property = "noticeTitle"/>
<jsp:setProperty name = "notice" property = "noticeContent"/>
 <%
 	System.out.println(notice);
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="nav.css">
 <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- 자바스크립트 함수 부분 -->

<script type="text/javascript">
function move(url){//링크 누르면 이동하게끔 해주는 함수
	location.href=url;
}

function writeCheck()//다 잘 적었는지 체크하는 함수
{
 var form = document.writeform;
 
if( !form.title.value )//제목을 입력하지 않았을 경우
 {
  alert( "제목을 적어주세요" );
  form.title.focus();
  return;
 }

if( !form.memo.value )//내용을 입력하지 않았을 경우(내용이 있어야지 뭘 하든 말든 할터이니..)
 {
  alert( "내용을 적어주세요" );
  form.memo.focus();
  return;
 }
 
form.submit();
}
</script>

<title>게시판 글쓰기</title>

</head>

<!-- 디자인 및 세션값 받아오는 부분  -->

<body style="height:1500px">
<%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String) session.getAttribute("userID");
	}
%>

<!-- 로그인이 되었을 경우와 안되었을 경우 두가지로 나누었다 . 로그인이 안된 상태이면 로그인 및 회원가입이 가능하게 -->

<%
	if(userID == null){ //userID가 null 값 = 로그인이 안된 상태
%>
<div class="topnav">
	<a class="active" href="index.jsp" >FarFromHome</a>
		<div class="topnav-right">
	   		<a class="nav-link active" href="login.jsp">로그인</a>
        	<a class="nav-link active" href="join.jsp">회원가입</a>
       	<!--  	<a class="nav-link active" href="toGoList.jsp">마이페이지</a> -->
		</div>
</div>


<!-- userID에 값이 있는 상태 = 로그인이 되어있는 상태 -->

<%} else{ %> 

<div class="topnav">
	<a class="active" href="index.jsp" >FarFromHome</a>
		<div class="topnav-right">
	   		<a class="nav-link active" href="logout.jsp">로그아웃</a>
        <!--   <a class="nav-link active" href="join.jsp">회원가입</a>  -->
       		<a class="nav-link active" href="toGoList.jsp">마이페이지</a>
		</div>
</div>
<%} %>

<!-- 여기는 디자인 부분 -->

<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed " >
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	게시판
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="faq.jsp">공지사항</a>
          <a class="dropdown-item" href="bbs.jsp">여행정보</a>
        </div>
      </li>  
      <li class="nav-item">
        <a class="nav-link" href="info.jsp">여행정보 검색</a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	고객 서비스
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Qna.jsp">Q/A</a>
          <a class="dropdown-item" href="Report.jsp">1:1 신고</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="guide.jsp">사이트 이용안내</a>
      </li>
    </ul>
  </div>
</nav>


<!-- 파일 내용 작성 부분 ! warning이 뜨긴하는데 이유는 center 태그 때문인듯 하다.  -->


<center>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0" align = "center">
     <tr text-align:center;">
     <br>
      <td width="5"></td>
      <td align = "center"><h2>글쓰기</h2></td>
      <td width="5"></td>
     </tr>
    </table>
    
   <table>
   
   <form name = writeform method = post action = "postAction.jsp" enctype="multipart/form-data" align = "center">   
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">제 목</td>
      <td>&nbsp;<input name="title" size=80% maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
 <!--    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="name" size=100% maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr> -->
    
    
      <td>&nbsp;</td>
      <td align="center">파 일</td>
      <td>&nbsp;<input type = "file" name="file" value = "파일 첨부" size=100% maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">내 용</td>
      <td>&nbsp;<textarea name="memo" cols=80% rows=10%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
     <!-- 
      <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td>&nbsp;<input type = "password" name = "password" size=20% maxlength="20"></td>
      <td>&nbsp;</td>
     </tr>
     -->
     
     
     
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2">
      <input type=button value="등록" onclick = "javascript:writeCheck();">
       <input type=button value="취소" onclick = "move('faq.jsp')">
       <input type=button value = "초기화" onclick = "javascript:history.back(-1)">
       </td>
      <td>&nbsp;</td>
     </tr>
     </form>
   </table>
   </td>
  </tr>
 </table>
 </center>

	<!--  -->			
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<%@ include file="./footer.jsp" %>

</body>
</html>