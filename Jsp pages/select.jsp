<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*" %>
<%!

java.sql.Connection con=null; 
java.sql.Statement Statement=null;
java.sql.ResultSet usersResultSet=null;
%>


<%!
public String formatUsersForHtml(java.sql.ResultSet usersResultSet)
{
String str="<table style='border:2px solid saddlebrown'>";
str+="<tr>";
str+="<td style='border:1px solid saddlebrown'>username</td>";
str+="<td style='border:1px solid saddlebrown'>password</td>";
str+="<td style='border:1px solid saddlebrown'>Email</td>";
str+="<td style='border:1px solid saddlebrown'>favorite time period</td>";
str+="<td style='border:1px solid saddlebrown'>Favorite special weapon</td>";
str+="</tr>";
	      
	try
	{
		while(usersResultSet.next()) 
		{
		  str+="<tr>";
		  str+="<td style='border:1px solid saddlebrown'>"+usersResultSet.getString("username").toString()+"</td>";
		  str+="<td style='border:1px solid saddlebrown'>"+usersResultSet.getString("password").toString()+"</td>";
		  str+="<td style='border:1px solid saddlebrown' >"+usersResultSet.getString("email").toString()+"</td>";
		  str+="<td style='border:1px solid saddlebrown'>"+usersResultSet.getString("time_period").toString()+"</td>";
		  str+="<td style='border:1px solid saddlebrown'>"+usersResultSet.getString("special_weapon").toString()+"</td>";
		
		  str+="</tr>";
	    }
		  str+="</table>";	
	} 
	catch(Exception ex)
	{
		System.out.print("error with login");
	}
	return str;
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title> Test Database </title> 
<style>
table{
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
  margin-left: auto;
  margin-right: auto;
}
td
{
	color: snow;
}
body {
  background-image: url(../Imgs/backround4.jpg);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
a:link {
  font-size: 25px;
  margin: 0 20px;
  margin-top: 10px;
  color: #1098ad;
  text-decoration: none;
}
a:hover {
  color: orangered;
  font-weight: bold;
  text-decoration: underline orangered;
}
</style>
</head>
<body>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
      %>
      
<h3>User list:</h3> 
<table>
 <tr>
   <%
   try
   {
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
		Statement=con.createStatement();
	
   String sql = "SELECT * FROM TBUSERS";    
   usersResultSet=Statement.executeQuery(sql);
   }
	catch(Exception ex){
		System.out.println("Error in connection");
	}
	
   out.print(formatUsersForHtml(usersResultSet));
   usersResultSet.close();
   %>


 </tr>
</table>
<br></br>
<a href="manage.jsp"> back to manager </a>
</body>
</html>