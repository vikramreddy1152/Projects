<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt;
	 ResultSet rs;
	 String mid;
%>

<%
	try{
		mid=request.getParameter("meid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("delete from member_profile where mem_login_id='"+mid+"'");
	%>
<HTML>
<HEAD>
<link rel="stylesheet" href="style.css"></link>
</HEAD><BODY>
<jsp:forward page="admin_home.html"/></BODY></HTML>
<%
	stmt.close();
	con.close();
	}
catch(Exception e)
{
	e.printStackTrace();
}
%>