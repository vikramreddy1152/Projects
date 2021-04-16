<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
	String uid,pass;Boolean flag;
%>
<%
   try
   {
    uid=request.getParameter("uid").trim();
	pass=request.getParameter("pass").trim();

	
	
	System.out.println(" Uid is :"+uid);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select mod_login_id,password from moderator_profile");
	    
	flag=true;

	while(rs.next())
	   {
		if(uid.equals(rs.getString(1))){
    	 if(pass.equals(rs.getString(2)))
			{
			 flag=false;
			 session.setAttribute("uid",uid);
			// stmt.close();
			// con.close();
			 response.sendRedirect("modlinks.html");
			}
		   }
	   }//while
	   if(flag){
%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR>
<br><br><h4><font color="red">You are Entering wrong Username and password.</h4>
            <jsp:include page="mod_login.html"/></body><HTML>
<%
			}//if
       stmt.close();
	  con.close();
	 
  
   }//try
   
   catch(Exception e){
        e.printStackTrace();}
   %>