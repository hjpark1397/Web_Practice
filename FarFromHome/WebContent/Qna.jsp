<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style="height:1500px">
<div class="topnav">
	<a class="active" href="index.jsp" >FarFromHome</a>
		<div class="topnav-right">
	   		<a class="nav-link active" href="login.jsp">�α���</a>
        	<a class="nav-link active" href="join.jsp">ȸ������</a>
       		<a class="nav-link active" href="toGoList.jsp">����������</a>
		</div>
</div>
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
          	�Խ���
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="faq.jsp">��������</a>
          <a class="dropdown-item" href="bbs.jsp">��������</a>
        </div>
      </li>  
      <li class="nav-item">
        <a class="nav-link" href="info.jsp">�������� �˻�</a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	�� ����
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Qna.jsp">Q/A</a>
          <a class="dropdown-item" href="Report.jsp">1:1 �Ű�</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="guide.jsp">����Ʈ �̿�ȳ�</a>
      </li>
    </ul>
  </div>
</nav>
<%@ include file="./footer.jsp" %>
</body>
</html>