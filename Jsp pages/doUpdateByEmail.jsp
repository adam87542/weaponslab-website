<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%--����� �� ������ --%>
<%!

java.sql.Connection con=null;
java.sql.Statement st=null;
java.sql.ResultSet usersResultSet=null;

%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="jedesign.css"/>
  <title>Updating user which was found</title> 
</head>
<body>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
%>
      
<div style="text-align:center">
 <h3> update details</h3>
 <form id="theForm" action="doUpdateByEmail.jsp">
  <table>
   <tr>
      <td> username  </td>
      <th> <input type="text" size="10" name="username" value=<%=session.getAttribute("username")%>></th>
   </tr>
   <tr>
      <td>password </td>
      <th> <input type="text" size="10" name="password" value=<%=session.getAttribute("password")%>></th>
   </tr>
   <tr>
      <td> Email </td>
      <th><input type="text" size="20" name="email" value=<%=session.getAttribute("email")%>></th>
   </tr>
   <tr>
      <td> does want to know about famous wars? </td>
      <th> <input type="text" size="10" name="famous_wars" value=<%=session.getAttribute("famous_wars")%>></th>
   </tr>
   <tr>
      <td> special weapon</td>
       <th> <input type="text" size="10" name="special_weapon" value=<%=session.getAttribute("special_weapon")%>></th>
   </tr>
   <tr>
    <td align="center" colspan="2">
	<input type="submit" id="send" name="send" value="send">
    <input type="reset" id="reset" name="reset" value="reset">
    
    </td>
   </tr>
  </table>
 </form>
</div>
<br>
<%
if(request.getParameter("send")!=null)
    {
	  String username=request.getParameter("username");
	  String password=request.getParameter("password");
	  String email=request.getParameter("email");
      String time_period =request.getParameter("time_period");
      String special_weapon =request.getParameter("special_weapon");
	  
	//����� ��� ���� ������� 
	   try
	    {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
			st= con.createStatement();
	    }
		catch(Exception ex){
			System.out.println("Error in connection "+ex);
		}

		String sql="UPDATE TBUSERS SET username='"+username+"',password='"+password+"',email='"+email+"',time_period='"+time_period+"',special_weapon='" +special_weapon+ "' WHERE email='"+email+"'";	
		try
		{
			st.executeUpdate(sql);
			out.print("update has been successful!"); 
			st.close();
			con.close();
		}
		catch(Exception ex)
		{
			System.out.print("Error: "+ ex);
		}
	}
%>
<br><br>
<a href="manage.jsp"> go back </a><br> 
<a href="select.jsp"> show updated table</a>
</body>
</html>