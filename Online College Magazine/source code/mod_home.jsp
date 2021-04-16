<%@ page import="java.sql.*"%>

<%!
    Connection con;
	Statement stmt;
	ResultSet rs;
	String uid,username;
%>

<%
   try
   {
      uid=(String)session.getAttribute("uid");

	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	  stmt=con.createStatement(); 
	  rs=stmt.executeQuery("select name from moderator_profile where mod_login_id='"+uid+"'");
	  
	  if(rs.next())
		  username=rs.getString(1);
	  stmt.close();
	  con.close();
   }//try
   catch(Exception e){
        e.printStackTrace();}
%>

<html>
<head>

<link rel="stylesheet" href="style.css"></link>
</head>
<body>
<BR>
<br>
<center><font color="white"><h2>Welcome to <%=username%></h2>(Moderator)  </font></center>
<br>
</body>
</html>