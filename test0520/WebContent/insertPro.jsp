<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("EUC-KR");%>
<%
String idt = request.getParameter("idt");
String passwd= request.getParameter("passwd");
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
Timestamp register=new Timestamp(System.currentTimeMillis());
Connection conn=null;
PreparedStatement pstmt=null;
String str="";

try{
String jdbcUrl="jdbc:mysql://localhost:3306/db?serverTimezone=UTC";//
String dbId="root";
String dbPass="test1234";
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
String sql= "insert into member values (null,?,?,?,?,?,?)";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,idt);
pstmt.setString(2,passwd);
pstmt.setTimestamp(3,register);
pstmt.setString(4,name);
pstmt.setString(5,addr);
pstmt.setString(6,tel);
pstmt.executeUpdate();
out.println("member ���̺� ���ο� ���ڵ带 �߰��߽��ϴ�.");
}catch(Exception e){
e.printStackTrace();
out.println("member ���̺� ���ο� ���ڵ带 �߰��� �����߽��ϴ�");
}finally{
if(pstmt != null)
try{pstmt.close();}catch(SQLException sqle){}
if(conn != null)
try{conn.close();}catch(SQLException sqle){}
}
%>