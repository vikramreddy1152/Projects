<%@ page import="java.sql.*"%>

<%!
    Connection con;
	Statement stmt,stmt1;
	ResultSet rs;
	String uid,username,t;
%>

<%
   try
   {
      uid=(String)session.getAttribute("uid");

	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	  stmt=con.createStatement(); stmt1=con.createStatement();
	  rs=stmt.executeQuery("select name from member_profile where mem_login_id='"+uid+"'");
	  if(rs.next())
		  username=rs.getString(1);
	  stmt.close();
      rs=stmt1.executeQuery("select type from members where unique_id='"+uid+"'");
	  if(rs.next())
		  t=rs.getString(1);
	  stmt1.close();
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
<center><h2><font color="white">Welcome to <%=username%></h2>(<%=uid.toUpperCase()%>)</center></font>
<br>
</body>
</html>