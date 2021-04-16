<%@ page import="java.sql.*"%>

<%!
     Connection con;
	 Statement stmt,stmt1;
	 ResultSet rs,rs1;
	 String category;int i;
%>

<%
	try{

	category=request.getParameter("cat");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ocm", "ocm");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from feedback ");
%>
<html>
<HEAD>
 
<link rel="stylesheet" href="style.css"></link>
</HEAD>
<body><BR><BR>
<form action="">
<table  align="center" cellpadding="3" cellspacing="3" >
<tr>
   <td colspan=2 align="center"><strong><font size="5" color="purple">Feedbacks</font></strong></td></tr>
  <td align="center"><strong><font size="4" color="maroon">Feedback ID</font></strong></td>
  <td align="center"><strong><font size="4" color="maroon">Feedback</font></strong></td>
 </tr>
<%
	while(rs.next())
	{
%>
<tr>
   <td align="center"><font size="2" color="fuchsia"><%=rs.getInt(1)%></font></td>
   <td align="center"><font size="2" color="fuchsia"><%=rs.getString(2)%></font></td>
 </tr>
<%
	}
%>
<tr><td><pre>    </pre></td></tr>
</table>
</form>
</body></HTML>
<%
     
	 stmt.close();
     stmt1.close();
     con.close();
  }
catch(Exception e)
{
	e.printStackTrace();
}
%>