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
  
</head>
<body>
<%
if ((session.getAttribute("MyADMIN")== null)|| !session.getAttribute("MyADMIN").equals("OK"))
			response.sendRedirect ("noManage.jsp");
%>
      
<div style="text-align:center">
 <h3> update admin password</h3>
 <form id="theForm" action="doUpdateAdpass.jsp">
  <table>
   
   <tr>
      <td>enter new admin password</td>
      <th> <input type="text" size="10" name="adPass" value=<%=session.getAttribute("adPass")%>></th>
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
	 // String adName=request.getParameter("adName");
	 String adName=(String)session.getAttribute("adName");
	  String adPass=request.getParameter("adPass");
	 
	  
	   try
	    {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
			st=con.createStatement();
	    }
		catch(Exception ex){
			System.out.println("Error in connection-1"+ex);
		}
		String sql="UPDATE TBADMIN SET adName='"+adName+"',adPass='"+adPass+"' WHERE adName='"+adName+"'";		
		try
		{
			st.executeUpdate(sql);
			out.print("update has been done succesfuly !"); 
			st.close();
			con.close();
		}
		catch(Exception ex)
		{
			System.out.print("Error in connection-2"+ex);
		}
	}
%>
<br><br>
<a href="manage.jsp"> back to manager page </a><br> 
<a href="adDet.jsp"> show admin details</a>
</body>
</html>