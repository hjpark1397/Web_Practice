<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "user.UserDAO" %> <!-- userDao�� Ŭ���� ������ -->
    <%@ page import = "java.io.PrintWriter" %> <!-- �ڹ� Ŭ���� ��� -->
    <% request.setCharacterEncoding("UTF-8"); %>
    
 <!-- �Ѹ��� ȸ�������� ��� userŬ������ �ڹ� ����� ��� / scope:������ ������ ������������ ��� -->
 <jsp:useBean id = "user" class = "user.User" scope = "page"/>
 <jsp:setProperty name = "user" property = "userID"/>
 <jsp:setProperty name = "user" property = "userPassword"/>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content = "text/html; charset = UTF-8">
<meta charset="EUC-KR">
<title>jsp �Խ��� ������Ʈ</title>
</head>
<body>
<%
	UserDAO userDAO = new UserDAO();//�ν��Ͻ� ����
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	
	//�α��� ����
	if(result == 1){
		PrintWriter script = response.getWriter();
		session.setAttribute("userID",user.getUserPassword());
		script.println("<script>");
		script.println("location.href = 'main.jsp'");//�α��ο� �����ϸ� ����ȭ������ �����ش�.
		script.println("</script>");
	}
	//�α��� ����
	else if(result==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��й�ȣ�� Ʋ���ϴ�.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	//���̵� ����
	else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�������� �ʴ� ���̵� �Դϴ�.')");
		script.println("history.back()");
		script.println("</script>");

	}//DB ����
	else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB������ �߻��߽��ϴ�.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>

</body>
</html>