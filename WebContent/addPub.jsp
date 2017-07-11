<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>addPublisher.jsp</title>
</head>
<body>
	<form action=""  method="post">
	<h1><label>请输入出版社信息：</label></h1>
	<label>出版社编号:</label><br>
	<input type="text" name="id"><br>
	<label>出版社名称:</label><br>
	<input type="text" name="name"><br>
	<label>出版社地址:</label><br>
	<input type="text" name="address"><br>
	<label>联系电话:</label><br>
	<input type="text" name="phone"><br><br>
	<input type="submit" value="提交">
</form>
</body>
</html>
<%
	request.setCharacterEncoding("gb2312");
	Connection con=null;
	PreparedStatement ps=null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:myOracle","c##salesuser","user");
//		String strSql="insert into PUBLISHING_COMPANY(PUB_ID,PUB_NAME,PUB_ADD,PUB_PHONE) VALUES(?,?,?,?)";
		String strSql="insert into PUBLISHING_COMPANY(PUB_ID,PUB_NAME,PUB_ADD,PUB_PHONE) VALUES('00007','beijing',null,null)";
		ps=con.prepareStatement(strSql);
/*		String id=request.getParameter("id");*/
	/*	String name=request.getParameter("name");
		String add=request.getParameter("address");
		String phone=request.getParameter("phone");
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, add);
		ps.setString(4, phone);*/
		int result=ps.executeUpdate();
		if(result==1){
			out.println("插入成功！");
		}
		else{
			out.println("插入失败");
		}
		
		con.commit();
		ps.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}

%>