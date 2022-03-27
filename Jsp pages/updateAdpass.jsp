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

</head>
<body>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
      %>
      
<div style="text-align:center"><br>
<h3>update user details</h3>
<form method="post" action="updateAdpass.jsp">
  admin username <input type="text" name="adName" size="20"> <br>
 
 <input type="submit" value="send" name="send"><br>
</form>
</div>
<%
boolean userFound=false;
if(request.getParameter("send")!=null)
{
	String adName=request.getParameter("adName"); //קריאת שם משתמש
	
	
	//יצירת קשר למסד הנתונים 
	   try
	   {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
			st=con.createStatement();
		
	   String sql="SELECT * FROM TBADMIN WHERE adName='"+adName+"' "; //שאילתת SQL
	   usersResultSet=st.executeQuery(sql);                  //קולט את הטבלה של ה sql
	   if (usersResultSet!=null && usersResultSet.next())
	   {
		 userFound=true;  
	   }
	   if(userFound) //שמירת נתוני משתמש שמצאנו
	   {
		   session.setAttribute("adName",usersResultSet.getString("adName"));
		   session.setAttribute("adPass",usersResultSet.getString("adPass"));
		  
		   //הפניה לדף לביצוע העדכון
		   response.sendRedirect("doUpdateAdpass.jsp");
	   }
	   else
	   {
		   out.print("admin username is not correct");
	   }
      }
	catch(Exception ex)
	{
		System.out.println("Error in connection" + ex.getMessage());
	}
  }
%>
<br>
<a href="manage.jsp"> back to maganer site </a>
</body>
</html>
