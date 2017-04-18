<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
response.addHeader("X-XSS-Protection","0");
request.setCharacterEncoding("UTF-8"); 
String id=request.getQueryString();
String text=request.getParameter("text");
if(text==null){
if(id==null) 
	id="ToeqPslI62";
else
	id=id.substring(5);
Class.forName("com.mysql.jdbc.Driver");
String DBname="jdbc:mysql://123.206.88.84:3306/JStorage?useUnicode=true&characterEncoding=UTF-8";
String DBuser="root";
String DBcode="";
System.out.println("Connecting to database...");
Connection conn = DriverManager.getConnection(DBname,DBuser,DBcode);
System.out.println("success!");
Statement ps=(Statement)conn.createStatement();
String sql="SELECT * FROM javascript WHERE id='"+id+"'";
ResultSet rs=null;
rs=ps.executeQuery(sql);
rs.next();
out.print(rs.getString("code"));}
else
out.print(text);
%>
