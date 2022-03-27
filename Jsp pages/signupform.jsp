<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link rel="stylesheet" type="text/css" href="../Css//SignUpstyle.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<script language="javascript">
function correctcity(st)
{
	var count=0;
	for(var i=0;i<st.length;i++)
	{    
		if(st.charAt(i)>='a' && st.charAt(i)<='z')
			count++;

		if(st.charAt(i)>='A' && st.charAt(i)<='Z')
			count++;
		if (st.charAt(i)==" ")
		    count++;

	}
	if(count==st.length)
		return true;
	return false;
}

function notEmpty(st)
{
	if(st.length==0)
	   return false ;
	return true ;
}
function correctName(st)
{
	var count=0;
	for(var i=0;i<st.length;i++)
	{    
		if(st.charAt(i)>='a' && st.charAt(i)<='z')
			count++;

		if(st.charAt(i)>='A' && st.charAt(i)<='Z')
			count++;

	}
	if(count==st.length)
		return true;
	return false;
}


function checkShtrudel(st)
{
	if(st.indexOf('@')==-1)
		return false;
	if(st.indexOf('@')!=st.lastIndexOf('@'))
		return false;
	return true;
}
function checkDot(st)
{
	if(st.indexOf('.')==-1)
		return false;
	return true;
}

function notTogether(st)
{
	var n1,n2;
	n1=st.indexOf('@');
	n2=st.indexOf('.');
	if(Math.abs(n1-n2)==1)
		return false;
	n2=st.lastIndexOf('.');
	if(Math.abs(n1-n2)==1)
		return false;
	return true;
}


function correctEmail(st)
{
	var count=0;
	for(i=0;i<st.length;i++)
	{
		if(st.charAt(i)>='a' && st.charAt(i)<='z')
			count++;
		if(st.charAt(i)>='0' && st.charAt(i)<='9')
			count++;
		if(st.charAt(i)>='A' && st.charAt(i)<='Z')
			count++;
		if(st.charAt(i)=='.' || st.charAt(i)=='_' || st.charAt(i)=='@'|| st.charAt(i)=='-')
			count++;
	}
	if(count==st.length)
		return true;
	return false;
}

function notBeginEnd(st)
{  
	if(st.indexOf('@')==0 || st.indexOf('@')==st.length-1)
		return false;
	if(st.indexOf('.')==0 || st.lastIndexOf('.')==st.length-1)
		return false;
	return true;
}

function restaurantCheck(st)
 { 
 if (st.selectedIndex==0)
     {	 
	     return false;
	 }
	 return true;
 }
function checkBox(st)
 {
for (var i=0; i<st.length; i++)
 if (st[i].checked==true)
   return true;
return false;   
} 
function checkRadio(st)
 {
for (var i=0; i<st.length; i++)
 if (st[i].checked==true)
   return true;
return false;   
} 

function mainFunc() 
{

var st=document.myForm.username.value;
if(!notEmpty(st)) 
{
	window.alert("username cannot be blank");
	return false;
}

if(!correctName(st))
{
	window.alert("user name can contain only english letters");
	return false;
}

 st=document.myForm.email.value;
if(!notEmpty(st))
{
	window.alert("email cant be blank");
	return false;
}

if(!checkShtrudel(st))
{
	window.alert("emial does not contain shturdel!");
	return false;
}

if(!checkDot(st))
{
	window.alert("email does not contain a dot!");
	return false;
}

if(!notTogether(st))
{
	window.alert("The dot and the shtrudel cant be next to each other");
	return false;
}

if(!correctEmail(st))
{
	window.alert("email can contain only english letters, numbers and the folowwing marks: '.', '-', '_', '@' ");
	return false;
}

if(!notBeginEnd(st))
{
	window.alert("email can not end with shtrudel or a dot");
	return false;
}
st=document.myForm.time_period;
if(!checkRadio(st))
{
window.alert("please mark your favorite time period");
return false;
}




 return true;
}
</script>
</head>
 
  <body>
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
        <h1>Welcome to weapons lab Sign Up page</h1>
        <p>Please fill this fields to create an account</p>
      </div>

      <hr />
      <form name="myForm" onsubmit="return mainFunc();" method="post" action="signupform.jsp">
        <table>
          <tr>
            <td>
              <label for="username"
                ><b>Enter your username</b></label
              >
              <input
                name="username"
                type="text"
                id="username"
              />
              <p class="feedback" id="feedback-username"></p>
            </td>
          </tr>
          <tr>
            <td>
              <label class="input-text" for="email"
                ><b>Email</b></label
              >
              <input
                name="email"
                type="text"
                id="email"
              />
              <p class="feedback" id="feedback-email"></p>
            </td>
          </tr>
          <tr>
            <td>
              <label  class="input-text" for="psw"
                ><b>Password</b></label
              >
              <input
                name="password"
                type="password"
                id="password"
              />
              <p class="feedback" id="feedback-password"></p>
            </td>
          </tr>
          <tr>
            <td>
              <label
                class="input-text"
                for="psw-repeat"
                ><b>Repeat Password</b></label
              >
              <input
                name="confirm_password"
                type="password"
                id="confirm-password"
              />
              <p class="feedback" id="feedback-confirm-password"></p>
            </td>
          </tr>
          <tr>
            <td id="time-period">
              <p>Choose your preffered time period</p>
              <div>
                <input name="time_period"  type="radio" id="Yes"/>
                <label>American Civil War</label>

                <input name="time_period" type="radio" id="No" />
                <label>World War I</label>
                <input name="time_period" type="radio" id="No" />
                <label>World War II</label>
                <input name="time_period"  type="radio" id="Yes"/>
                <label>Korean War</label>

                <p class="feedback" id="feedback-time-period"></p>
              </div>
            </td>
          </tr>
          <tr>
            <td id="special-weapon">
              <p>Select your favorite special weapon</p>
              <div>
                <select name="special_weapon">
                  <option value="grenade_launchers">grenade launchers</option>
                  <option value="rocket_launchers">rocket launchers</option>
                  <option value="machine_guns">machine guns</option>
                  <option value="revolvers">revolvers</option>
                </select>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="SignUp-Cancel">
                <input type="reset" class="cancelbtn" value="Cancel"/>
                <input type="submit" name="Confirmlbutton" class="signupbtn" value="Sign Up" />
              </div>
            </td>
          </tr>
        </table>
      </form>
    </div>

<%
   if(request.getMethod().equals("POST"))
  {	    
    String username=request.getParameter("username");  
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String time_period =request.getParameter("time_period");
    String special_weapon = request.getParameter("special_weapon");
    String  result [][] = null;	
    try 
	{

	Class.forName("com.mysql.jdbc.Driver").newInstance();	
	 	 	
	   Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
	 	

	 Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	             						       ResultSet.CONCUR_UPDATABLE);
	  		
	  String mySQL = "SELECT * from TBUSERS WHERE email= '" + email +"'"; 
	  System.out.println(mySQL);
			  		
	ResultSet oRS = st.executeQuery(mySQL);				
		 	
		 			
		int numColumns = oRS.getMetaData().getColumnCount();
		 oRS.last();				
		int numRows = oRS.getRow();
		 	
		 result = new String[numRows][numColumns];	
		 oRS.beforeFirst();
		 int i = 0;
		 while (oRS.next())
		 {
		 	for(int j = 0; j < numColumns; j++ )
		 		result[i][j]=oRS.getString(j+1);				
		 	i++;
		 }		
		 oRS.close();	
		 st.close();	
		 } 
		 catch (Exception e) 
		 {	  			
		    //e.printStackTrace();
		   System.out.println("Register Error in connecting" + e);
		  } //======================= the connection is closed

		if(result.length>0)
			 out.print("there is already a user with this email");
		else
		{
			try 
			{
				 Class.forName("com.mysql.jdbc.Driver").newInstance();	
			  Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/DBADAM","root","");
			  Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);

	      String mySQL = "INSERT INTO TBUSERS(username,password,email, time_period, special_weapon)";
	      mySQL += "values('"+username+ "','" +password+ "','" +email+ "','" +time_period+ "','"+ special_weapon +"')";
        System.out.println(mySQL);
        int n = st.executeUpdate(mySQL);  
        st.close();
        con.close();
      } 
	    catch (Exception e) 
	    {	  			
	     System.out.println("Register Error in connecting" + e);
	    }   
	  out.print(" <br/><br/>");
		out.print("<br />");
    }
			}
		%>	
		</body>
		</html>


