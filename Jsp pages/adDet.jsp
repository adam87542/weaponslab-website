<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*" %>

<%!

java.sql.Connection con=null; 
java.sql.Statement st=null;
java.sql.ResultSet usersResultSet=null;
%>
<%!

public String formatUsersForHtml(java.sql.ResultSet usersResultSet)
{
String str="<table style='border:2px solid brown'>";
str+="<tr>";
str+="<td style='border:1px solid brown'>Admin username</td>";
str+="<td style='border:1px solid brown'>Admin Pass </td>";

str+="</tr>";
	      
	try
	{
		while(usersResultSet.next()) // �� �� ���� ���� ����� ��� ���� �� ��� ����
		{
		  str+="<tr>";
		  str+="<td style='border:1px solid brown'>"+usersResultSet.getString("adName").toString()+"</td>";
		  str+="<td style='border:1px solid brown'>"+usersResultSet.getString("adPass").toString()+"</td>";
		  
		
		  str+="</tr>";
	    }
		  str+="</table>";	
	} //end of try
	catch(Exception ex)
	{
		System.out.print("Error in conecting");
	}
	return str;
}
%>


<html>
<head>
<link rel="stylesheet" type="text/css" href="jedesign.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title> Test Database </title> 
</head>
<body>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
      %>
      
<h3>���� ����</h3> 
<table >
 <tr>
   <%
   try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
		st=con.createStatement();
	
   String sql="SELECT * FROM TBADMIN";     
   usersResultSet=st.executeQuery(sql);
   }
	catch(Exception ex){
		System.out.println("ERROR: " + ex.getMessage());
	}
	//������� ����� ������� ���� ���� ������� �� ������� ��������� ������
   out.print(formatUsersForHtml(usersResultSet));
   usersResultSet.close();
   %>
   <%-------------------------------------------------------------- --%>

 </tr>
</table>
<br></br>
<a href="manage.jsp"> Back to manager page </a>
</body>
</html>