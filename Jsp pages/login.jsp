<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href="../Css//SignUpstyle.css" rel="stylesheet" />
<title>checkManager Page</title>
</head>
<body>
    <% 	
	// the first time the page is sent to the user
	 	// the SUBMIT button was not pressed yet.		 												
		if(request.getParameter("login") == null )	//it means that the form is seen the first time
		 { 
			
	%>
    <div class="container">
      <img
        class="gun-images"
        id="stg-44"
        src="../Imgs//Sturmgewehr_44.jpg"
        alt="stg 44 image"
      />
      <img
        class="gun-images"
        id="mp5"
        src="../Imgs//csm_MP5A3_re_6691b1ed48.png"
        alt="mp5 image"
      />

      <div class="header">
        <h1>Welcome to weapons lab login page</h1>
        <p>Please fill this fields to login to an account</p>
      </div>

      <hr />
      <form name="myform" method="post" action="login.jsp">
        <table>
          <tr>
            <td>
              <label for="username"
                ><b>Enter your username</b></label>
              <input
                name="username"
                type="text"
                id="username"
              />
            </td>
            </tr>
              <tr>
            <td>
            <label for="username"
                ><b>Enter your password</b></label>
             <input name="password" type="password" id="password"/>
            </td>
          </tr>
           <tr>
            <td>
              <div class="button-boxes">
                <input type="submit" class="signupbtn" name="login" value="login">
                <input type="reset" class="cancelbtn" value="Cancel"/>
              </div>
            </td>
          </tr>
        </table>
      </form>
    </div>
    <% 	 
	}
	else	// יוצרים תקשורת למסד הנתונים
	{
	String username = request.getParameter("username"); //אמור להיות לפי השם שלמעלה
	String password = request.getParameter("password");	  		
	try 
	 {
	 // שלב א: טעינת המתפעל - דרייבר
	Class.forName("com.mysql.jdbc.Driver").newInstance();	
	//שלב ב:חיבור למסד הנתונים
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
		
	//שלב ב:חיבור למסד הנתונים
	Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		                						   ResultSet.CONCUR_UPDATABLE);

	String mySQL = "SELECT * FROM TBUSERS WHERE username='" + username + "' AND password ='" + password + "'" ;//קולט לתוך המשתנה את פרטי המשתמש שהוקלד שתואמים את מה שיש ב mysql
	
	ResultSet oRS = st.executeQuery(mySQL);				
	session.setAttribute("USER", "NotOK");			
	oRS.last();		
	int numRows = oRS.getRow();
	if (numRows > 0)	
	   {				
	    session.setAttribute("USER","OK");	
	   }
		oRS.close();
		st.close();
	
	} 
	  catch (Exception e) 
	  {
	  	//e.printStackTrace();
		System.out.println("Error in connection"+e);
	} // the connection is closed	  		
	  	if ( session.getAttribute("USER").equals("OK") )
				response.sendRedirect ("index.html");
		else
				response.sendRedirect ("errorInLogin.jsp");				
	}	
    %>		
  </body>
</html>