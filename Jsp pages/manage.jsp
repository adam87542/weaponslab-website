<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Css/manage.css"/>
<title> Administrator Page </title> 
</head>
<body dir="rtl">

<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK")) // בדיקה האם המשתמש רשאי להיכנס לדף ניהול של אתר, צריך לבדוק מה הערך במשתנה סאשן
			response.sendRedirect ("noManage.jsp");
      %>
      
<center> <h1> ADMINISTRATOR PAGE </h1> </center>
<div>
 <h2> U have number of options </h2>
 <form id="managerForm" action="manage.jsp" method="post">
 <table>
   <tr>
   <th colspan="2"> show all the users </th>
   <td>
    <input type="submit" id="allUsers" name="sendUser" value="Show All" style="height: 25px; width: 200px">
   </td>
   </tr>
   <tr>
   <th colspan="2"> show all the users by weapon </th>
   <td>
    <input type="submit" id="showByWeapon"  name="sendUser" value="Show by weapon" style="height: 25px; width: 200px">
   </td>
   </tr>
   <tr>
   <th colspan="2"> Delete by email </th>
   <td>
    <input type="submit" id="deletUser" name="sendUser" value="Delete" style="height: 25px; width: 200px">
   </td>
   </tr>
   <tr>
   <th colspan="2"> Update user details by email </th>
   <td>
   <input type="submit" id="updateUser1" name="sendUser" VALUE="Update By Email" style="height: 25px; width: 200px">
   </td>
   </tr>
   <tr>
   <th colspan="2"> Update user details </th>
   <td>
   <input type="submit" id="updateUser2" name="sendUser" VALUE="Update By details" style="height: 25px; width: 200px">
   </td>
   </tr>
   <tr>
   <th colspan="2"> וpdate manager name </th>
   <td>
    <input type="submit" id="updateAdmin1" name="sendUser" value="Update Admin's name" style="height: 25px; width: 200px">
   </td>
   </tr>
    <tr>
   <th colspan="2"> update manager password </th>
   <td>
    <input type="submit" id="updateAdmin2" name="sendUser" value="Update Admin's password" style="height: 25px; width: 200px">
   </td>
   </tr>
       <tr>
   <th colspan="2">  admin details </th>
   <td>
    <input type="submit" id="Admin" name="sendUser" value="Admin" style="height: 25px; width: 200px">
   </td>
   </tr>
 </table>
 </form>
</div>

<%
String s=request.getParameter("sendUser");
try {
	if(s.equals("Show All"))
	{
		response.sendRedirect("select.jsp");
	}
	else if(s.equals("Delete"))
	{
		response.sendRedirect("delete.jsp");
	}
	else if(s.equals("Update By Email"))
	{
		response.sendRedirect("UpdateByEmail.jsp");
	}
	else if(s.equals("Update By details"))
	{
		response.sendRedirect("UpdateByDetails.jsp");
	}
	else if(s.equals("Show by weapon"))
	{
		response.sendRedirect("ShowByFavoriteWeapon.jsp");
	}
	else if(s.equals("Update By Details"))
	{
		response.sendRedirect("UpdateByDetails.jsp");
	}
	else if(s.equals("Update Admin's name"))
	{
		response.sendRedirect("updateAdname.jsp");
	}
	else if(s.equals("Update Admin's password"))
	{
		response.sendRedirect("updateAdpass.jsp");
	}
	else if(s.equals("Admin"))
	{
		response.sendRedirect("adDet.jsp");
	}
	}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>