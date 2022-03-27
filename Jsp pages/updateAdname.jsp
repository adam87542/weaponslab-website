<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>

<%!

java.sql.Connection connection=null;
java.sql.Statement st=null;
java.sql.ResultSet usersResultSet=null;
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="jedesign.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">

</head>
<body>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
      %>
      
<div style="text-align:center"><br>
<h3>update admin name</h3>
<form method="post" action="updateAdname.jsp">
 password <input type="text" name="adPass" size="20"> <br>
 
 <input type="submit" value="send" name="send"><br>
</form>
</div>
<%boolean userFound=false;
if(request.getParameter("send")!=null)
{
	String adPass =request.getParameter("adPass"); // read username
	
	    try
	     {
		   	// connect to database
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
			st =connection.createStatement();
		
		// Prepare sql query to avoid sql injection!
		String sql="SELECT * FROM TBADMIN WHERE adPass='"+adPass+"' "; //SQL query		

		// excute and get results
	    usersResultSet = st.executeQuery(sql);             
	    if (usersResultSet != null && usersResultSet.next())
		  userFound=true;  

	   if(userFound) // if we found the admin
	   	{
		   session.setAttribute("adName",usersResultSet.getString("adName"));
		   session.setAttribute("adPass",usersResultSet.getString("adPass"));
		  
		   // update admin name in databse
		   response.sendRedirect("doUpdateAdname.jsp");
	    }
	    else
		   out.print("wrong admin password");
	   
         }
	catch(Exception ex)
	{
		System.out.println("Error in connection: " + ex);
	}
  }
%>
<br>
<a href="manage.jsp"> back to manager page </a>
</body>
</html>
