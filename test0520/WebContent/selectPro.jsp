<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> 회원 정보 표시 </title>
</head>
<body>
<table border="1">
<tr>
<td>아이디
<td>비밀번호
<td>이름
<td>가입일자
<td>주소
<td>전화번호
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
try{
String jdbcUrl="jdbc:mysql://localhost:3306/db?serverTimezone=UTC";
String dbId="root";
String dbPass="test1234";
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
String sql= "select * from member";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

while(rs.next()){
String id= rs.getString("mem_id");
String passwd= rs.getString("mem_pwd");
String name= rs.getString("mem_name");
Timestamp register=rs.getTimestamp("reg_date");
String address= rs.getString("address");
String tel= rs.getString("tel");
%>
<tr>
<td><%=id%>
<td><%=passwd%>
<td><%=name%>
<td><%=register.toString()%>
<td><%=address%>
<td><%=tel%>
<% }
}catch(Exception e){
e.printStackTrace();
}finally{
if(rs != null)
try{rs.close();}catch(SQLException sqle){}
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%>
</table>
</body>
</html>