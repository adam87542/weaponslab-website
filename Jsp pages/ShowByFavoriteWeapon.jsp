<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%--����� �� ������ --%>
<%!

java.sql.Connection con=null;
java.sql.Statement st=null;
java.sql.ResultSet rs=null;// ����� ������(������� �� ������)
%>


<html>
<head>
<link rel="stylesheet" type="text/css" href="jedesign.css"/>
<title> Find user from database </title> 
</head>
<body dir="rtl">
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
      %>
      
<div style="text-align:center"><br>
<h3>show selected users</h3>
<form method="post" action="ShowByFavoriteWeapon.jsp">
<table>
 <tr> <td>enter special weapon name </td><td><input type="text"  name="special_weapon" size="20"></td></tr>
 <tr><td><input type="submit" value="send" name="send"></td><td></td></tr>
 </table>
</form>
</div>
<br>
<%!
public String formatUsersForHtml(java.sql.ResultSet rs) 
{
	String str="<table style='border:2px solid brown'>";
	str+="<tr>";
	str+="<td style='border:1px solid brown'>username</td>";
	str+="<td style='border:1px solid brown'>password</td>";
	str+="<td style='border:1px solid brown'>Email</td>";
	str+="<td style='border:1px solid brown'>does want History</td>";
	str+="<td style='border:1px solid brown'>preffred weapon</td>";
	str+="</tr>";
		      
		try
		{
			while(rs.next()) 
			{
			  str+="<tr>";
		  str+="<td style='border:1px solid brown'>"+rs.getString("username").toString()+"</td>";
		  str+="<td style='border:1px solid brown'>"+rs.getString("password").toString()+"</td>";
		  str+="<td style='border:1px solid brown'>"+rs.getString("email").toString()+"</td>";
		  str+="<td style='border:1px solid brown'>"+rs.getString("time_period").toString()+"</td>";
		  str+="<td style='border:1px solid brown'>"+rs.getString("special_weapon").toString()+"</td>";
		
			
			  str+="</tr>";
		    }
			  str+="</table>";	
	} //end of try
	catch(Exception ex)
	{
		System.out.print("Error in connection" + ex.getMessage());
	}
	return str;
}
%>
<%
boolean userFound=false;
if(request.getParameter("send")!=null) // SEND �� �� �����
{
  String special_weapon =request.getParameter("special_weapon"); 
	   try
	   {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
			st=con.createStatement();
		
	   String sql="SELECT * FROM TBUSERS WHERE special_weapon='" + special_weapon +"'"; 
	   rs=st.executeQuery(sql);
	   rs.last();
	   int numRow=rs.getRow();
	   if (numRow>0)
	   {
		   rs.beforeFirst();
		   out.print(formatUsersForHtml(rs));
		   rs.close();
	   }
	   else 
	   {
		   out.print("ERROR there is no user that have "+ special_weapon + " in there details");
	   }
	   st.close();
	   con.close();
	   }
	catch(Exception ex) 
	{
		System.out.println("Error in connection" + ex.getMessage());
	}
}
%>
<br>
<a href="manage.jsp"> back to manage site</a> 
<br><br>