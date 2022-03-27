<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>

<%!

java.sql.Connection con=null;
java.sql.Statement st=null;
java.sql.ResultSet usersResultSet=null;
String str;
%>

<html>
<head>
<title>delete person from database</title>
</head>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
      %>
      
<%

   try
{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
		st=con.createStatement();
   }
	catch(Exception ex){
		System.out.println("Error in connection");
	}
	str="DELETE FROM TBUSERS WHERE email ='"+session.getAttribute("email")+"'";
	try
	{
		int n=st.executeUpdate(str);
		st.close();
		con.close();
	}
	catch(SQLException ex)
	{
		System.out.println("SQLException:"+ex.getMessage());
		System.out.println("SQLState:" +ex.getSQLState());
	}
%>
<br><br>
<a href="manage.jsp"> go back </a><br></br>
<a href="select.jsp"> show updated user table </a> 
</body>
</html>