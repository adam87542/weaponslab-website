<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%--הצהרה על משתנים --%>
<%!

java.sql.Connection con=null;
java.sql.Statement st=null;
java.sql.ResultSet usersResultSet=null;
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="jedesign.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>find user and update his details</title>
</head>
<body>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
      %>
      
<div style="text-align:center"><br>
<h3>Update user details</h3>
<form method="post" action="UpdateByDetails.jsp">
 username <input type="text" name="username" size="20"> <br>
 password <input type="text" name="password" size="20"> <br>
 <input type="submit" value="send" name="send"><br>
</form>
</div>
<%
boolean userFound=false;
if(request.getParameter("send")!=null)
{
	String username=request.getParameter("username"); //קריאת שם משתמש
	String password=request.getParameter("password"); //קריאת שם משתמש
	
	//יצירת קשר למסד הנתונים 
	   try
	   {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
			st=con.createStatement();
		
	   String sql="SELECT * FROM TBUSERS WHERE username='"+ username +"'and password='"+password+"'"; //שאילתת SQL
	   usersResultSet=st.executeQuery(sql);                  //קולט את הטבלה של ה sql
	   if (usersResultSet!=null && usersResultSet.next())
	   {
		 userFound=true;  
	   }
	   if(userFound) //שמירת נתוני משתמש שמצאנו
	   {
		   session.setAttribute("username",usersResultSet.getString("username"));
		   session.setAttribute("password",usersResultSet.getString("password"));
		   session.setAttribute("email",usersResultSet.getString("email"));
		   session.setAttribute("famous_wars",usersResultSet.getString("famous_wars"));
		   session.setAttribute("favorite_weapon",usersResultSet.getString("favorite_weapon"));
		   //הפניה לדף לביצוע העדכון
		   response.sendRedirect("doUpdateByDetails.jsp");
	   }
	   else
	   {
		   out.print("user was not found");
	   }
      }
	catch(Exception ex)
	{
		System.out.println("Error in connection");
	}
  }
%>
<br>
<a href="manage.jsp"> back to manage site </a>
</body>
</html>
