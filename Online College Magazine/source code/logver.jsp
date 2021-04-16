<%@ page import="java.sql.*"%>

<%!
	String uid,pass;
%>
<%
   try
   {
    uid=request.getParameter("uid").trim();
	pass=request.getParameter("pass").trim();

   
	  if(uid.equals("admin"))
	   {
		 if(pass.equals("admin"))
		   {
			 session.setAttribute("uid",uid);
			 
			 response.sendRedirect("adminlinks.html");
		   }//pif
		   else{
%>
<HTML>
<HEAD>
 
<link rel="stylesheet" href="style.css"></link>
</HEAD><BODY>
<br><br><h4><font color="red">You are Entering wrong password. Try again.....</font></h4>
            <jsp:include page="admin_login.html"/></BODY></HTML>
<%
			}//pel
		}//uif
		else
	      {
%><HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD><BODY>
<br><br><h4><font color="red">You are Entering wrong User ID and Passwords. Try again.....</font></h4>
<jsp:include page="admin_login.html"/></BODY></HTML>
<%
		  }//uel
  
   }//try
   catch(Exception e){
        e.printStackTrace();}
   %>