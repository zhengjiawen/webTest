<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>showAll.jsp</title>
</head>
<body>
<%
	System.out.println("begin");
	out.print("hello");
	
try{
	Connection con;
	ResultSet rs;
	Statement stmt;
	Class.forName("oracle.jdbc.driver.OracleDriver");
//	java.sql.DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	con=java.sql.DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:myOracle","c##salesuser","user");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from PUBLISHING_COMPANY");
	out.println("<table border=1 width=400>");
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		String add=rs.getString(3);
		String phone=rs.getString(4);
		System.out.println(id+name+add+phone);
		out.print("<tr><td>"+id+"</td><td>"+name+"</td><td>"+add+"</td><td>"+phone+"</td></tr>");
	}
	out.println("</table>");
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){
	out.println(e.getMessage());
}
%>
</body>
</html>